module Api::V1
  class ProjectsController < ApiController

    def index
      @projects = Project.all
    end

  end
end
