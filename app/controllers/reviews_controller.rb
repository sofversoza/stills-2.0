class ReviewsController < ApplicationController
    rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable
    rescue_from ActiveRecord::RecordNotFound, with: :render_error
    def index
        reviews = Review.all
        render json: reviews
    end

    def create
        review = Review.create!(review_params)
        render json: review, status: :created
    end
    
    def destroy
        review = Review.find(params[:id])
        review.destroy
        head :no_content
    end

    def update
        review = Review.find(params[:id])
        review.update(review_params)
        render json: review, status: :accepted
    end

    private
    def review_params
        params.permit(:rating, :comment, :user_id, :movie_id)
    end

    def render_unprocessable(i)
        render json: {errors: i.record.errors.full_messages}, status: :unprocessable_entity
    end

    def render_error(e)
        render json: {error: "#{e.model} not found"}, status: :not_found
    end
end
