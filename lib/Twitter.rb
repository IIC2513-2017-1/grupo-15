#require 'httparty'

class Twitter
  #include HTTParty
  #format :json

  #base_uri 'twitter.com'

  defaults = {consumerKey: Figaro.env.consumer_key, consumerSecret: Figaro.env.consumer_secret,
    token: Figaro.env.token, token_secret: Figaro.env.token_secret, callback_url: "http://127.0.0.1:3000/oauth/callback"}

  def initialize
  end

  def self.get_tweets(project_name)
    access_token = prepare_access_token()
    response = access_token.request(:get, "https://api.twitter.com/1.1/search/tweets.json?q=%40#{project_name}")
    if response.success?
      new(response)
    else
      raise response.response
    end
  end

  def prepare_access_token()
    consumer = OAuth::Consumer.new(defaults.consumerKey, defaults.consumerSecret, { :site => "https://api.twitter.com", :scheme => :header })

    # now create the access token object from passed values
    token_hash = { :oauth_token => defaults.token, :oauth_token_secret => defaults.token_secret }
    access_token = OAuth::AccessToken.from_hash(consumer, token_hash )

    return access_token
  end

end
