class HomeController < ApplicationController
  before_action :set_categories, only: [:index]

  def index
    @projects = Project.all
    @response = get_tweets("nasa")
    @response["statuses"].each do |tweet|
      puts tweet["text"]
    end
    if params[:category]
      @projects = Project.where(category_id: params[:category])
      project = @projects.first
      render json: {
        id: project.id,
        description: project.description,
        name: project.name,
        owner: project.user.name,
        goal: project.goal,
        pledged: project.current_amount.to_i,
        rate: project.current_amount/project.goal
      }
    end
  end

  private
    def get_tweets(project_name)
      access_token = prepare_access_token()
      response = access_token.request(:get, "https://api.twitter.com/1.1/search/tweets.json?q=%40#{project_name}")
      if response
        return JSON.parse(response.body)
      else
        return response
      end
    end

    def prepare_access_token()
      defaults = {consumerKey: Figaro.env.consumer_key, consumerSecret: Figaro.env.consumer_secret,
        token: Figaro.env.token, token_secret: Figaro.env.token_secret, callback_url: "http://127.0.0.1:3000/oauth/callback"}
      consumer = OAuth::Consumer.new(defaults[:consumerKey], defaults[:consumerSecret], { :site => "https://api.twitter.com", :scheme => :header })

      # now create the access token object from passed values
      token_hash = { :oauth_token => defaults[:token], :oauth_token_secret => defaults[:token_secret] }
      access_token = OAuth::AccessToken.from_hash(consumer, token_hash )

      return access_token
    end

end
