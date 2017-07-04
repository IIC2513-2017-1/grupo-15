module ProjectsHelper
  def category_name
    if params[:category]
      Category.find(params[:category].to_i).name
    end
  end
end
