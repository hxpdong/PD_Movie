import os
import numpy as np
from flask import Flask, jsonify, request
from flask_restful import Api, Resource, reqparse
from flask_cors import CORS
import pandas as pd
import traceback
import requests

app = Flask(__name__)
CORS(app)
api = Api(app)

# Biến toàn cục để lưu trữ dữ liệu
global_df = None
global_user_item_matrix = None
global_item_similarity = None

def reload_rating():
    global global_df
    response_rating = requests.get("http://127.0.0.1:8000/api/recommend-rating")
    rating_data = response_rating.json()
    items = rating_data.get('items', [])
    global_df = pd.DataFrame(items)
    

def load_data(file_path):
    if not os.path.exists(file_path):
        raise FileNotFoundError(f"File not found: {file_path}")
    return pd.read_csv(file_path)

def update_data(user_id, movie_id, rating):
    global global_df
    global global_user_item_matrix
    global global_item_similarity

    rating = float(rating)

    # Cập nhật hoặc thêm mới rating
    global_user_item_matrix.at[user_id, movie_id] = rating

    # Cập nhật DataFrame
    global_df.loc[(global_df['user_id'] == user_id) & (global_df['movie_id'] == movie_id), 'rating'] = rating

    # Tính toán lại ma trận tương tự
    global_item_similarity = get_item_similarity(global_user_item_matrix)

    return {'success': True, 'message': f'Rating for User ID {user_id} and Movie ID {movie_id} updated successfully'}, 200

# Hàm lấy độ tương tự giữa các mục
def get_item_similarity(user_item_matrix):
    user_item_matrix_np = user_item_matrix.to_numpy().astype(float)  # Chuyển đổi đánh giá thành số thực
    return np.dot(user_item_matrix_np.T, user_item_matrix_np) / (np.linalg.norm(user_item_matrix_np.T, axis=1) * np.linalg.norm(user_item_matrix_np, axis=0))

def get_recommendations(user_id, num_recommendations):
    global global_user_item_matrix
    global global_item_similarity

    try:
        user_id = int(user_id)  # Chắc chắn user_id là kiểu int
        user_index = global_user_item_matrix.index.get_loc(user_id)

        items_not_rated_by_user = global_user_item_matrix.columns[global_user_item_matrix.loc[user_id] == 0]
        
        # Chuyển đổi predicted_ratings thành kiểu float
        predicted_ratings = np.dot(global_item_similarity, global_user_item_matrix.to_numpy(dtype=float)[user_index]) / (np.sum(np.abs(global_item_similarity), axis=1) + 1e-8)
        
        top_recommendations = np.argsort(predicted_ratings)[::-1]
        recommendations = [{'item_id': int(item_id), 'estimated_rating': float(predicted_ratings[item_id])} for item_id in top_recommendations if item_id in items_not_rated_by_user][:num_recommendations]
        
        item_ids = [recommendation["item_id"] for recommendation in recommendations]
        item_id_string = f"{', '.join(map(str, item_ids))}"

        return {'success': True, 'recommendations': recommendations, 'itemId_list': item_id_string}, 200

    except KeyError:
        return {'success': False, 'error': f'Invalid user ID {user_id}'}, 400

class RecommendationResource(Resource):
    def get(self):
        try:
            user_id = int(request.args.get('user_id'))
            num_recommendations = int(request.args.get('num_recommendations', 5))
            
            recommendations = get_recommendations(user_id, num_recommendations)
            return recommendations

        except Exception as e:
            traceback.print_exc()
            return {'success': False, 'error': str(e)}, 500

    def post(self):
        try:
            global global_df
            global global_user_item_matrix
            global global_item_similarity

            user_id = int(request.args.get('user_id'))
            movie_id = int(request.args.get('movie_id'))
            rating =int(request.args.get('ratingpoint'))
            num_recommendations = int(request.args.get('num_recommendations', 5))

            # Kiểm tra xem có tồn tại cặp user_id và movie_id không
            if (user_id in global_user_item_matrix.index) and (movie_id in global_user_item_matrix.columns):
                update_data(user_id, movie_id, rating)

            # Nếu không tồn tại, thêm mới rating
            else:
                new_rating = {'user_id': user_id, 'movie_id': movie_id, 'rating': rating}
                global_df = global_df.append(new_rating, ignore_index=True)
                global_user_item_matrix = global_df.pivot(index='user_id', columns='movie_id', values='rating').fillna(0)
                global_item_similarity = get_item_similarity(global_user_item_matrix)

            # Lấy các đề xuất mới dựa trên dữ liệu đã cập nhật
            recommendations = get_recommendations(user_id, num_recommendations)

            return recommendations

        except Exception as e:
            traceback.print_exc()
            return {'success': False, 'error': str(e)}, 500

class DeleteMovieResource(Resource):
    def delete(self, movie_id):
        global global_df
        global global_user_item_matrix
        global global_item_similarity

        try:
            # Chuyển đổi movie_id thành kiểu int
            movie_id = int(movie_id)

            # Kiểm tra xem movie_id có tồn tại trong cột 'movie_id' của global_df không
            if movie_id in global_df['movie_id'].unique():
                # Xóa dữ liệu liên quan đến movie_id trong global_df
                global_df = global_df[global_df['movie_id'] != movie_id]

                # Cập nhật lại global_user_item_matrix và global_item_similarity
                global_user_item_matrix = global_df.pivot(index='user_id', columns='movie_id', values='rating').fillna(0)
                global_item_similarity = get_item_similarity(global_user_item_matrix)

                return {'success': True, 'message': f'Movie ID {movie_id} deleted successfully'}, 200
            else:
                return {'success': False, 'error': f'Movie ID {movie_id} not found'}, 404

        except ValueError:
            return {'success': False, 'error': f'Invalid movie ID {movie_id}'}, 400

class ReloadData(Resource):
    def get(self):
        global global_df
        global global_user_item_matrix
        global global_item_similarity
        try:
            reload_rating()
            global_user_item_matrix = global_df.pivot(index='user_id', columns='movie_id', values='rating').fillna(0)
            global_item_similarity = get_item_similarity(global_user_item_matrix)
        except Exception as e:
            traceback.print_exc()
            return {'success': False, 'error': str(e)}, 500

api.add_resource(RecommendationResource, '/recommend')
api.add_resource(DeleteMovieResource, '/delete_movie/<int:movie_id>')
api.add_resource(ReloadData, '/reload-data')

if __name__ == '__main__':
    # Đọc dữ liệu vào biến toàn cục khi máy chủ được khởi động
    #file_path = '../public/storage/ratings.csv'
    #global_df = load_data(file_path)
    reload_rating()
    global_user_item_matrix = global_df.pivot(index='user_id', columns='movie_id', values='rating').fillna(0)
    global_item_similarity = get_item_similarity(global_user_item_matrix)

    app.run(debug=True, port=8300)
