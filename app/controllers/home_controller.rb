class HomeController < ApplicationController
  before_action :set_categories, only: [:index]

  def index
    @projects = Project.all
    if params[:category]
      @projects = Project.where(category_id: params[:category])
      project = @projects.first
      render json: {
        id: project.id,
        description: project.description,
        name: project.name,
        owner: project.user.name,
        goal: project.goal,
        pledged: project.current_amount.to_i,
        rate: project.current_amount/project.goal
      }
    end
  end
end
