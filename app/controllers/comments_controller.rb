class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :edit, :update, :destroy]
  before_action :current_user
  before_action :is_profile_owner?, only: [:edit, :update, :destroy]

  def create
    @project = Project.find(params[:project_id])
    @comment = @project.comments.build(content: comment_params[:content], user_id: @current_user.id)
    respond_to do |format|
      if @comment.save
        format.html { redirect_to @project, notice: 'Comment was successfully created.' }
        format.js
        format.json { render :show, status: :ok, location: @comment }
      else
        format.html { render :edit }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    def set_comment
      @comment = Comment.find(params[:id])
    end

    def comment_params
      params.require(:comment).permit(:content)
    end
end
