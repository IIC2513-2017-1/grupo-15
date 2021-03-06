class PledgesController < ApplicationController
    before_action :current_user
    before_action :is_profile_owner?, only:[:create]
  
  def index
    @pledges = Pledge.all
  end

  def new
    if logged_in?
      @project = Project.find(params[:project_id])
      @reward = Reward.find(params[:reward_id])
      @pledge = Pledge.new
    else
      redirect_to new_user_path, notice:"Log-in to continue"
    end
  end

  def create
    @project = Project.find(pledge_params[:project_id])
    @reward = Reward.find(pledge_params[:reward_id])
    @pledge = Pledge.new(pledge_params)
    @pledge.user_id = @current_user.id


    respond_to do |format|
      if @pledge.save
        format.html { redirect_to @pledge.project, notice: 'Pledge was successfully created.' }
        format.json { render :show, status: :created, location: @pledge }
      else
        format.html { render :new }
        format.json { render json: @pledge.errors, status: :unprocessable_entity }
      end
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
