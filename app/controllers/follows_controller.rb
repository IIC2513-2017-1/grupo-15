class FollowsController < ApplicationController

before_action :logged_in?
  
  def new
    @follow = Follow.new
  end

  
  def create
    @follow = Follow.new(pledge_params)
    follower = User.find(params[:follow][:follower_id])
    following = User.find(params[:follow][:following_id])
    respond_to do |format|
      if @follow.save
        #FollowMailer.new_follow_email(user, current_user).deliver_later
        FollowMailer.new_follower_email(following, follower).deliver_later
        
        format.html { redirect_to @follow.follower, notice: 'Following relationship was successfully created.' }
        format.json { render :show, status: :created, location: @follow }
      else
        format.html { render :new }
        format.json { render json: @follow.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
  end

  private

    def pledge_params #tengo q borrar el project id
      params.require(:follow).permit(:follower_id,:following_id)
    end

end
