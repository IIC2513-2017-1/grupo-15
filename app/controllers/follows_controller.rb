class FollowsController < ApplicationController

before_action :logged_in?

  def new
    @follow = Follow.new
  end

  def create
    @follow = Follow.new(follower_id: params[:follower_id], following_id: params[:following_id])
    respond_to do |format|
      if @follow.save
        follower = User.find(params[:follower_id])
        following = User.find(params[:following_id])
        FollowMailer.new_follower_email(following, follower).deliver_later
        format.html { redirect_to @follow.following}
      else
        redirect_to users_path(@user), notice: "an error has ocurred, you can't follow this user"
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
