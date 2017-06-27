module Api::V1
  class CommentsController < ApiController
    before_action :authenticate
    
    def show
      comment = Comment.find_by(project_id: params[:project_id], id: params[:id])
      render json: comment
    end
  end
end
