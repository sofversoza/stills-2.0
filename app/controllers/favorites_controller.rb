class FavoritesController < ApplicationController
    rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable
    rescue_from ActiveRecord::RecordNotFound, with: :render_error

    def index
        render json: Favorite.all, status: :ok
    end

    def create
        fav = Favorite.create!(user_id: params[:user_id], movie_id: params[:movie_id])
        render json: fav, status: :created
    end

    def destroy
        fav = Favorite.find(params[:id])
        fav.destroy
        head :no_content
    end




    private
    def render_unprocessable(i)
        render json: {errors: i.record.errors.full_messages}, status: :unprocessable_entity
    end

    def render_error(e)
        render json: {error: "#{e.model} not found"}, status: :not_found
    end
end
