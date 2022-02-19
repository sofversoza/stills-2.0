class MoviesController < 
    rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable
    rescue_from ActiveRecord::RecordNotFound, with: :render_error
    def index
        movies = Movie.all
        render json: movies
    end
    
    def show
        movie = Movie.find_by(slug: params[:slug])
        render json: movie, serializer: MovieSerializer
    end
    
    private
    def render_unprocessable(i)
        render json: {errors: i.record.errors.full_messages}, status: :unprocessable_entity
    end

    def render_error(e)
        render json: {error: "#{e.model} not found"}, status: :not_found
    end
end
