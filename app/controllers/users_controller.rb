class UsersController < ApplicationController
    # skip_before_action :authenticate_user, only: [:create]
    before_action :find_user, only: [:show, :update, :destroy]

    def index
      @users = User.all
      render json: @users, status: :ok
    end

    def show 
        render json: @user, status: 200
    end

     # POST /users
    def create
      @user = User.new(user_params)
      if @user.save
        render json: @user, status: :created
      else
        render json: { errors: @user.errors.full_messages },
              status: :unprocessable_entity
      end
    end
    def update 
      unless @user.update(user_params)
        render json: {erors: @user.errors.full_messages}, status: 503
      end
    end

    def destroy
      @user.destroy
    end

    private
     def user_params
        params.permit(:username, :email, :password)
     end

     def find_user
       @user = User.find(params[:id]) 
     end


end
