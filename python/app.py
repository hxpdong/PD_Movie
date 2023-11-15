import os
import numpy as np
from flask import Flask, jsonify, request
from flask_restful import Api, Resource, reqparse
from flask_cors import CORS
import pandas as pd
import traceback

app = Flask(__name__)
CORS(app)
api = Api(app)

def load_data(file_path):
    if not os.path.exists(file_path):
        raise FileNotFoundError(f"File not found: {file_path}")
    return pd.read_csv(file_path)

def get_item_similarity(user_item_matrix):
    user_item_matrix_np = user_item_matrix.to_numpy()
    return np.dot(user_item_matrix_np.T, user_item_matrix_np) / (np.linalg.norm(user_item_matrix_np.T, axis=1) * np.linalg.norm(user_item_matrix_np, axis=0))

def get_recommendations(user_id, num_recommendations, user_item_matrix, item_similarity, movies_df):
    user_id = int(user_id)  # Ensure user_id is an integer

    if user_id not in user_item_matrix.index:
        return {'success': False, 'error': f'User ID {user_id} not found'}, 400

    try:
        user_index = user_item_matrix.index.get_loc(user_id)
    except KeyError:
        return {'success': False, 'error': f'Invalid user ID {user_id}'}, 400

    # Lấy danh sách các cột (movieId) từ ma trận user_item_matrix
    items_not_rated_by_user = user_item_matrix.columns[user_item_matrix.loc[user_id] == 0].tolist()
    #items_not_rated_by_user = [item_id for item_id in range(1, user_item_matrix.shape[1] + 1) if user_item_matrix.loc[user_id, item_id] == 0]
    predicted_ratings = np.dot(item_similarity, user_item_matrix.to_numpy()[user_index]) / (np.sum(np.abs(item_similarity), axis=1) + 1e-8)
    top_recommendations = np.argsort(predicted_ratings)[::-1][:num_recommendations]
    recommendations = [{'item_id': int(item_id), 'estimated_rating': predicted_ratings[item_id - 1]} for item_id in top_recommendations + 1]

    # Lấy danh sách item_id từ kết quả
    item_ids = [recommendation["item_id"] for recommendation in recommendations]
    # Tạo chuỗi dạng "movie_id = 73 or movie_id = 209 or ..."
    #item_id_string = " or ".join([f"movie_id = {item_id}" for item_id in item_ids])
    item_id_string = f"{', '.join(map(str, item_ids))}"

    return {'success': True, 'recommendations': recommendations, 'itemId_list': item_id_string}, 200



class RecommendationResource(Resource):
    def post(self):
        try:
            parser = reqparse.RequestParser()
            parser.add_argument('user_id', type=int, required=True, help='User ID is required')
            parser.add_argument('num_recommendations', type=int, default=5, help='Number of recommendations')
            args = parser.parse_args()

            user_id = args['user_id']
            num_recommendations = args['num_recommendations']

            #file_path = '../public/storage/ratings.csv'
            file_path = 'public/storage/ratings.csv'
            df = load_data(file_path)
            user_item_matrix = df.pivot(index='userId', columns='movieId', values='rating').fillna(0)
            item_similarity = get_item_similarity(user_item_matrix)

            recommendations = get_recommendations(user_id, num_recommendations, user_item_matrix, item_similarity, df)

            return recommendations

        except Exception as e:
            traceback.print_exc()  # In đống gọi hàm đầy đủ vào console
            return {'success': False, 'error': str(e)}, 500

api.add_resource(RecommendationResource, '/recommend')

if __name__ == '__main__':
    app.run(debug=True, port=8300)
