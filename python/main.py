import os
import numpy as np
from flask import Flask, jsonify, request
from flask_restful import Api, Resource
from flask_cors import CORS
import pandas as pd
import traceback
import requests
from sklearn.metrics.pairwise import cosine_similarity

app = Flask(__name__)
CORS(app)
api = Api(app)

# Biến toàn cục để lưu trữ dữ liệu
global_df = None
global_user_item_matrix = None
global_user_similarity = None

def reload_rating():
    global global_df
    response_rating = requests.get("http://127.0.0.1:8000/api/recommend-rating")
    rating_data = response_rating.json()
    items = rating_data.get('items', [])
    global_df = pd.DataFrame(items)
    unique_user_ids = global_df['user_id'].unique()
    unique_movie_ids = global_df['movie_id'].unique()
    all_user_ids = np.arange(1, unique_user_ids.max() + 1)  # hoặc có thể chọn giá trị tối đa từ SQL data
    all_movie_ids = np.arange(1, unique_movie_ids.max() + 1)  # hoặc có thể chọn giá trị tối đa từ SQL data
    all_user_movie_combinations = pd.DataFrame([(user_id, movie_id) for user_id in all_user_ids for movie_id in all_movie_ids], columns=['user_id', 'movie_id'])
    global_df = pd.merge(all_user_movie_combinations, global_df, on=['user_id', 'movie_id'], how='left').fillna(0)

def update_data(user_id, movie_id, rating):
    global global_df
    global global_user_item_matrix
    global global_user_similarity
    try:
        user_id = int(user_id)
        movie_id = int(movie_id)
        rating = float(rating)
    except (ValueError, TypeError):
        return {'success': False, 'error': 'Invalid input types'}, 400

    # Cập nhật hoặc thêm mới rating
    global_user_item_matrix.at[user_id, movie_id] = rating

    # Cập nhật DataFrame
    global_df.loc[(global_df['user_id'] == user_id) & (global_df['movie_id'] == movie_id), 'rating'] = rating
    
    # Tính toán lại ma trận tương tự user
    global_user_similarity = get_user_similarity(global_user_item_matrix)

    return {'success': True, 'message': f'Rating for User ID {user_id} and Movie ID {movie_id} updated successfully'}, 200

# Hàm lấy độ tương tự giữa các người dùng
def get_user_similarity(user_item_matrix):
    user_item_matrix_np = user_item_matrix.to_numpy().astype(float)  # Chuyển đổi đánh giá thành số thực
    #return np.dot(user_item_matrix_np, user_item_matrix_np.T) / (np.linalg.norm(user_item_matrix_np, axis=1) * np.linalg.norm(user_item_matrix_np.T, axis=0))
    user_similarity = cosine_similarity(user_item_matrix_np)
    return user_similarity

def get_recommendations_resnick(user_id, num_recommendations):
    global global_user_item_matrix
    global global_user_similarity

    try:
        user_id = int(user_id)  # Chắc chắn user_id là kiểu int
        user_index = global_user_item_matrix.index.get_loc(user_id)

        items_not_rated_by_user = global_user_item_matrix.columns[global_user_item_matrix.loc[user_id] == 0]

        # Tính toán xếp hạng dự đoán sử dụng mô hình Resnick
        weighted_sum = np.dot(global_user_similarity[user_index], global_user_item_matrix.to_numpy(dtype=float))
        sum_of_weights = np.sum(np.abs(global_user_similarity[user_index]), axis=0) + 1e-8
        predicted_ratings_resnick = weighted_sum / sum_of_weights

        # Lọc ra các mục được đề xuất
        top_recommendations = np.argsort(predicted_ratings_resnick)[::-1]
        recommendations = [{'item_id': int(item_id), 'estimated_rating': float(predicted_ratings_resnick[item_id])} for item_id in top_recommendations if item_id in items_not_rated_by_user and predicted_ratings_resnick[item_id] > 0][:num_recommendations]
        if not recommendations:
            return {'success': False, 'error': 'No valid recommendations found for the user.'}, 400
        
        item_ids = [recommendation["item_id"] for recommendation in recommendations]
        item_id_string = f"{', '.join(map(str, item_ids))}"
        #print(global_user_item_matrix)
        return {'success': True, 'recommendations': recommendations, 'itemId_list': item_id_string}, 200

    except KeyError:
        return {'success': False, 'error': f'Invalid user ID {user_id}'}, 400

def print_user_similarity_for_user(user_similarity_matrix, user_ids, target_user_id):
    try:
        target_user_index = user_ids.get_loc(target_user_id)
        similarity_values = user_similarity_matrix[target_user_index]
        
        similar_users = [{"user_id": other_user_id, "similarity": similarity} for other_user_id, similarity in zip(user_ids, similarity_values) if other_user_id != target_user_id]
        sorted_similar_users = sorted(similar_users, key=lambda x: x["user_id"], reverse=True)
        
        print(f"User ID {target_user_id} Similarity:")
        for similar_user in sorted_similar_users:
            print(f"  Similarity to User ID {similar_user['user_id']}: {similar_user['similarity']}")
        print("\n")
        
    except KeyError:
        print(f"User ID {target_user_id} not found in the user matrix.")
        
# print_user_similarity_for_user(global_user_similarity, global_user_item_matrix.index, target_user_id)


class RecommendationResource(Resource):
    def get(self):
        try:
            user_id = int(request.args.get('user_id'))
            num_recommendations = int(request.args.get('num_recommendations', 5))
            
            #print_user_similarity_for_user(global_user_similarity, global_user_item_matrix.index, user_id)
            recommendations = get_recommendations_resnick(user_id, num_recommendations)
            return recommendations

        except Exception as e:
            traceback.print_exc()
            return {'success': False, 'error': str(e)}, 500

    def post(self):
        try:
            global global_df
            global global_user_item_matrix
            global global_user_similarity

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
                global_user_similarity = get_user_similarity(global_user_item_matrix)

            # Lấy các đề xuất mới dựa trên dữ liệu đã cập nhật
            recommendations = get_recommendations_resnick(user_id, num_recommendations)

            return recommendations

        except Exception as e:
            traceback.print_exc()
            return {'success': False, 'error': str(e)}, 500

class DeleteMovieResource(Resource):
    def delete(self, movie_id):
        global global_df
        global global_user_item_matrix
        global global_user_similarity

        try:
            # Chuyển đổi movie_id thành kiểu int
            movie_id = int(movie_id)

            # Kiểm tra xem movie_id có tồn tại trong cột 'movie_id' của global_df không
            if movie_id in global_df['movie_id'].unique():
                # Xóa dữ liệu liên quan đến movie_id trong global_df
                global_df = global_df[global_df['movie_id'] != movie_id]

                # Cập nhật lại global_user_item_matrix và global_user_similarity
                global_user_item_matrix = global_df.pivot(index='user_id', columns='movie_id', values='rating').fillna(0)
                global_user_similarity = get_user_similarity(global_user_item_matrix)

                return {'success': True, 'message': f'Movie ID {movie_id} deleted successfully'}, 200
            else:
                return {'success': False, 'error': f'Movie ID {movie_id} not found'}, 404

        except ValueError:
            return {'success': False, 'error': f'Invalid movie ID {movie_id}'}, 400

class ReloadData(Resource):
    def get(self):
        global global_df
        global global_user_item_matrix
        global global_user_similarity
        try:
            reload_rating()
            global_user_item_matrix = global_df.pivot(index='user_id', columns='movie_id', values='rating').fillna(0)
            global_user_similarity = get_user_similarity(global_user_item_matrix)
        except Exception as e:
            traceback.print_exc()
            return {'success': False, 'error': str(e)}, 500

api.add_resource(RecommendationResource, '/recommend')
api.add_resource(DeleteMovieResource, '/delete_movie/<int:movie_id>')
api.add_resource(ReloadData, '/reload-data')

if __name__ == '__main__':
    reload_rating()
    global_user_item_matrix = global_df.pivot(index='user_id', columns='movie_id', values='rating').fillna(0)
    global_user_similarity = get_user_similarity(global_user_item_matrix)

    app.run(debug=True, port=8300)
