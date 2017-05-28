class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user, :log_in, :logged_in?

  protected #ver si corresponde que vaya acá
    def set_categories
      @categories = Category.all
    end

  def log_in(user)
    session[:user_id] = user.id
  end

  # Returns the current logged-in user (if any).
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def logged_in?
    !current_user.nil?
  end

  def is_owner?
    redirect_to(root_path, notice: 'Unauthorized access!')    
  end
end
