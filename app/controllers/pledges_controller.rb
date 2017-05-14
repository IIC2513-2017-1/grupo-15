class PledgesController < ApplicationController

  def index
    @pledges = Pledge.all
  end

  def new
    @pledge = Pledge.new
  end

  def create
    @project = Project.find(params[:project_id])
    raise
    @pledge = Pledge.new(pledge_params)

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

    def pledge_params #tengo q borrar el project id
      params.require(:pledge).permit(:user_id, :project_id, :reward_id, :amount)
    end
end
