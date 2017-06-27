module Api::V1
  class ProjectsController < ApiController
    before_action :authenticate
    def index
      #@projects = Project.all
      render json: Project.all
    end

    def create
      @project = @current_user.projects.build(tweet_params)
      return if @project.save
      render json: { errors: @project.errors }, status: :unprocessable_entity
    end

    def show
      @project = Project.find(params[:id])
    end

    def create
     @project = @current_user.project.build(project_params)
     return if @project.save
     render json: { errors: @project.errors }, status: :unprocessable_entity
   end

   private
     def project_params
       params.require(:project).permit(:name, :description, :category_id, :user_id, :start_date, :end_date, :goal)
     end
  end
end
