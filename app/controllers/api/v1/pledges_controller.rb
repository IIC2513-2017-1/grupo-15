module Api::V1
  class PledgesController < ApiController
    before_action :authenticate

    def new
      @project = Project.find(params[:project_id])
      @reward = Reward.find(params[:reward_id])
      @pledge = Pledge.new
    end

    def create
      @project = Project.find(pledge_params[:project_id])
      @reward = Reward.find(pledge_params[:reward_id])
      @pledge = Pledge.new(pledge_params)
      @pledge.user_id = @current_user.id

      render json: @pledge if @pledge.save
      if @pledge.save
        render json:  @pledge
      else
        render json: { errors: @project.errors }, status: :unprocessable_entity  
      end
    end

    private
    def set_pledge
      @pledge = Pledge.find(params[:id])
    end
    def pledge_params #chequear nested forms
      params.require(:pledge).permit(:project_id, :reward_id, :amount)
    end
  end
end
