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
        rate: project.current_amount/project.goal,
        url: project.image.url,
        days: (((project.end_date-project.start_date)/ (24 * 60 * 60)).to_i).to_s,
        category: project.category.name,
        category_id: project.category.id
      }
    end
  end
end
