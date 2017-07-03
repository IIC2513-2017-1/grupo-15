class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update, :destroy]
  before_action :set_categories, :set_rewards, only: [:edit, :new, :show, :rewards]
  before_action :current_user
  before_action :is_project_owner?, only: [:edit, :update, :destroy]


  def index
    @categories = Category.all
    @projects = Project.all
    if params[:search]
      @projects = Project.search(params[:search])
    elsif params[:category] && params[:category].to_i != 0
      @projects = Project.where(category_id: params[:category].to_i)
    else
      @projects = Project.all.order('created_at DESC')
    end
    @projects = @projects.paginate(:page => params[:page], :per_page => 9)

    respond_to do |format|
      format.html
      format.js
    end

  end

  def show
    @current_amount = @project.current_amount
    @pledge = Pledge.new
    #response = get_tweets('nasa')
    response = get_tweets(@project.name)
    @tweets = []
    if response["statuses"]
      response["statuses"].each do |tweet|
        @tweets<< {text: tweet["text"], date: tweet["created_at"]}
      end
    end
  end

  def new
    if !logged_in?
      redirect_to new_session_path, notice: "Log in to continue"
    end
    @project = Project.new
  end

  def edit
  end

  def create
    @project = @current_user.projects.new(project_params)

    respond_to do |format|
      if @project.save
        (Follow.where(following_id: @current_user.id)).each do |query_result|
          to_user = User.find(query_result.follower_id)
          ProjectMailer.new_project_email(to_user, current_user).deliver_later
        end
        format.html { redirect_to edit_project_path(@project) , notice: 'Project was successfully created.' }
        format.json { render :show, status: :created, location: @project }
      else
        format.html { render :new }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @project.update(project_params)
        format.html { redirect_to @project, notice: 'Project was successfully updated.' }
        format.json { render :show, status: :ok, location: @project }
      else
        format.html { render :edit }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @project.destroy
    respond_to do |format|
      format.html { redirect_to projects_url, notice: 'Project was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def set_project
      @project = Project.find(params[:id])
    end

    def set_rewards
      @rewards = Reward.search(params[:id])
    end

    def project_params
      params.require(:project).permit(:name, :description, :category_id, :user_id, :start_date, :end_date, :goal, :image)
    end

    def get_tweets(project_name)
      access_token = prepare_access_token()
      response = access_token.request(:get, "https://api.twitter.com/1.1/search/tweets.json?q=%40#{project_name}")
      #byebug
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
