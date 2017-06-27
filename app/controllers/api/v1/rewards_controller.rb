module Api::V1
  class RewardsController < ApiController
  	before_action :authenticate
    
    def show
      reward = Reward.find_by(project_id: params[:project_id], id: params[:id]) 
      render json: reward
    end
  end
end
