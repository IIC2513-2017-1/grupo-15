module Api::V1
  class UsersController < ApiController
    
    def show
      user = User.where(id: params[:id]).select(:id, :name, :email, :token)
      render json: user
    end
    def index
    	users = User.all.select(:id, :name, :email, :token)
      render json: users
    end
  end
end
