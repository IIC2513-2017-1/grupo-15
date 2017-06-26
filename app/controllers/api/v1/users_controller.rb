module Api::V1
  class UsersController < ApiController
    before_action :authenticate
    
    def show
      user = User.where(id: params[:id]).select(:id, :name, :email)
      render json: user
    end
    def index
    	users = User.all.select(:id, :name, :email)
      render json: users
    end
  end
end
