class FollowsController < ApplicationController

before_action :logged_in?
  
  def new
    @follow = Follow.new
  end

  
  def create
    @follow = Follow.new(follower_id: params[:follower_id], following_id: params[:following_id])
    follower = User.find(params[:follow][:follower_id])
    following = User.find(params[:follow][:following_id])
    respond_to do |format|
      if @follow.save
        FollowMailer.new_follower_email(following, follower).deliver_later
        format.html { redirect_to @follow.following}
        format.json { render :show, status: :created, location: @follow }
      else
        format.html { render :new }
        format.json { render json: @follow.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @following_relationships = Follow.find_by(follower_id:params[:follower_id], following_id:params[:following_id])
    @following_relationships.destroy
    respond_to do |format|
      format.html { redirect_to user_path(params[:id] )}
      format.json { head :no_content }
    end
  end
end
