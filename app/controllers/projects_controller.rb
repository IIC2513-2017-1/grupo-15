class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update, :destroy]
  before_action :set_categories, :set_rewards, only: [:edit, :new, :show, :rewards]
  before_action :current_user
  before_action :is_project_owner?, only: [:edit, :update, :destroy]


  def index
    @categories = Category.all
    @projects = Project.all
    if params[:search]
      @projects = Project.search(params[:search])
    elsif params[:category] && params[:category].to_i != 0
      @projects = Project.where(category_id: params[:category].to_i)
    else
      @projects = Project.all.order('created_at DESC')
    end
    @projects = @projects.paginate(:page => params[:page], :per_page => 9)

    respond_to do |format|
      format.html
      format.js
    end

  end

  def show
    @current_amount = @project.current_amount
    @pledge = Pledge.new
  end

  def new
    if !logged_in?
      redirect_to new_session_path, notice: "Log in to continue"
    end
    @project = Project.new
  end

  def edit
  end

  def create
    @project = @current_user.projects.new(project_params)

    respond_to do |format|
      if @project.save
        (Follow.where(following_id: @current_user.id)).each do |query_result|
          to_user = User.find(query_result.follower_id)
          ProjectMailer.new_project_email(to_user, current_user).deliver_later
        end
        format.html { redirect_to edit_project_path(@project) , notice: 'Project was successfully created.' }
        format.json { render :show, status: :created, location: @project }
      else
        format.html { render :new }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @project.update(project_params)
        format.html { redirect_to @project, notice: 'Project was successfully updated.' }
        format.json { render :show, status: :ok, location: @project }
      else
        format.html { render :edit }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @project.destroy
    respond_to do |format|
      format.html { redirect_to projects_url, notice: 'Project was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def set_project
      @project = Project.find(params[:id])
    end

    def set_rewards
      @rewards = Reward.search(params[:id])
    end

    def project_params
      params.require(:project).permit(:name, :description, :category_id, :user_id, :start_date, :end_date, :goal)
    end
end
