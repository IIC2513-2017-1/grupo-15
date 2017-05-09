class SessionsController < ApplicationController
  def new
  end

  def create
    #log_in @user
    user = User.find_by(email: params[:session][:email])
    if user&.authenticate(params[:session][:password])
      log_in user
      redirect_to root_path, notice: 'Login successful'
    else
      #flash[:danger] = 'Invalid email/password combination' # Not quite right!
      #render 'new'
      redirect_to new_session_path, alert: "Wrong email/password combination"
    end
  end

  def destroy
    reset_session
    redirect_to root_path, notice: 'Logout successful.'
  end
end
