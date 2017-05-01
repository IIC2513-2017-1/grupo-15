class FollowsController < ApplicationController
  def new
    @follow = Follow.new
  end

  def create
    @follow = Follow.new(pledge_params)

    respond_to do |format|
      if @follow.save
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
