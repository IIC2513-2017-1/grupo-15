class HomeController < ApplicationController
  before_action :set_categories, only: [:index]

  def index; end
end
