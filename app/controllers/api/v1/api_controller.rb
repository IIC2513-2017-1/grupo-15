module Api::V1
  class ApiController < ActionController::API
    include ActionController::HttpAuthentication::Token::ControllerMethods

    attr_accesor :current_user
    protected

    def authenticate
      authenticate_or_request_with_http_token do |token, _options|
        @current_user = User.find_by(token: token)
      end
    end
    def paginate(resource)
	    resource = resource.page(params[:page] || 1)
	    if params[:per_page]
	      resource = resource.per_page(params[:per_page])
	    end

	    return resource
	  	end
	  #expects pagination!
  	def meta_attributes(object)
    	
{	      current_page: object.current_page,
	      next_page: object.next_page,
	      prev_page: object.previous_page,
	      total_pages: object.total_pages,
	      total_count: object.total_entries
	    }
		end

  end
end