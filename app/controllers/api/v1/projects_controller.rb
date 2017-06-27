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
      #@project = 
      render json: Project.find(params[:id]), include: ['rewards', 'comments']
		end

		private

    def project_params
      params.require(:project).permit(:name, :description, :start_date, 
      																:end_date, :category_id, :goal)
		end
    
	end
end
