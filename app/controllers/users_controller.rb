class UsersController < ApplicationController
    before_action :authorize, only: [:showme]
rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable
rescue_from ActiveRecord::RecordNotFound, with: :render_error
    def index
        users = User.all
        render json: users
    end

    def create
        user = User.create(user_params)
        if user.valid?
            render json: user, status: :created
        else
            render json: {errors: user.errors.full_message}, status: :unprocessable_entity
        end
    end

    def show
        user = User.find(params[:id])
        render json: user, serializer: UserSerializer, status: :ok
    end 


    def showme
        user = User.find_by(id: session[:user_id])
        render json: user, serializer: UserSerializer, status: :ok
    end

    def update
        user = User.find(params[:id])
        user.update(user_params)
        render json: user, status: :accepted
    end

    def destroy
        user = User.find(params[:id])
        user.destroy
        head :no_content
    end
    
    private
    
    def user_params
        params.permit(:email, :password, :full_name, :password_confirmation)
    end

    def authorize
    return render json: {error: "Not authorized"}, status: :unauthorized unless session.include? :user_id 
    end

    def render_unprocessable(i)
        render json: {errors: i.record.errors.full_messages}, status: :unprocessable_entity
    end

    def render_error(e)
        render json: {error: "#{e.model} not found"}, status: :not_found
    end
end
