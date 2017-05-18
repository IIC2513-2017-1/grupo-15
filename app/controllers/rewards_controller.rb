class RewardsController < ApplicationController
  before_action :set_project, only:[:index, :new, :create]

  def index
  end

  def new
    @reward = Reward.new
  end

  def edit
  end

  def create
    @reward = @project.rewards.new(reward_params)
    respond_to do |format|
      if @reward.save
        format.html { redirect_to project_rewards_path(@project), notice: 'Reward was successfully created.' }
        format.json { render :show, status: :created, location: @reward }
      else
        format.html { render :new }
        format.json { render json: @reward.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @reward.update(reward_params)
        format.html { redirect_to @reward, notice: 'Reward was successfully updated.' }
        format.json { render :show, status: :ok, location: @reward }
      else
        format.html { render :edit }
        format.json { render json: @reward.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @reward.destroy
    respond_to do |format|
      format.html { redirect_to pledges_url, notice: 'Reward was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_project
      @project = Project.find(params[:project_id])
    end

    def reward_params
      params.require(:reward).permit(:title, :amount, :description)
    end

end
