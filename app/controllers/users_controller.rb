class UsersController < ApplicationController
    def index
        users = User.all 
        render json: users 
    end

    def profile 
        favs = current_user.favorites
        render json: { user: current_user, favorites: favs }
    end

    def show
        user = User.find(params[:id])
        favorites = user.favorites
        
        render json: favorites
        
    end

    def create 
        
        user = User.create(user_params)

        if user.valid? 
            render json: {token: create_token(user.id)}
        else 
            render json: {errors: user.errors.full_messages}, status: 422
        end
    end

    private

    def user_params 
        params.permit(:username, :password)
    end
end
