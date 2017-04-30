class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  protected #ver si corresponde que vaya acá
    def set_categories
      @categories = Category.all
    end
end
