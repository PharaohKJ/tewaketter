class TweetsController < ApplicationController
  before_action :set_tweet, only: [:show, :edit, :update, :destroy]

  # GET /tweets
  # GET /tweets.json
  def index
    authenticate
    @tweets = Tweet.where(
      user_id: current_user.id,
      stat: nil
    ).order(:id)
  end

  # GET /tweets/1
  # GET /tweets/1.json
  def show
  end

  # GET /tweets/new
  def new
    auth_check
    @code = current_invite
    @tweet = Tweet.new(user_id: @code.config.user_id)
  end

  # GET /tweets/1/edit
  def edit
  end

  # POST /tweets
  # POST /tweets.json
  def create
    pp ENV['AWS_ACCESS_KEY']
    pp ENV['AWS_SECRET_ACCESS_KEY']
    # bucket: <%= ENV['BUCKET_NAME'] || 'tewaketter' %>
    @tweet = Tweet.new(tweet_params)

    respond_to do |format|
      if @tweet.save

        # TweetJob.perform_later(@tweet)

        format.html { redirect_to new_tweet_path, notice: 'Tweet was successfully created.' }
        format.json { render :show, status: :created, location: @tweet }
      else
        format.html { render :new }
        format.json { render json: @tweet.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tweets/1
  # PATCH/PUT /tweets/1.json
  def update
    respond_to do |format|
      @tweet.assign_attributes(tweet_params)
      @tweet.uuid = session[:uid]
      if @tweet.update(tweet_params)
        format.html { redirect_to @tweet, notice: 'Tweet was successfully updated.' }
        format.json { render :show, status: :ok, location: @tweet }
      else
        format.html { render :edit }
        format.json { render json: @tweet.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tweets/1
  # DELETE /tweets/1.json
  def destroy
    @tweet.destroy
    respond_to do |format|
      format.html { redirect_to tweets_url, notice: 'Tweet was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def all
    to = params[:to_id].to_i
    targets = Tweet.where(
      id: (0..to),
      user_id: params[:user_id].to_i,
      stat: nil
    )

    count = targets.length

    Tweet.transaction do
      targets.update_all(stat: 1) # 1 is enqued
      targets.each do |r|
        TweetJob.perform_later(r)
      end
    end

    redirect_to tweets_path,
                notice: "#{count}件ツイート予約しました"
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_tweet
    @tweet = Tweet.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def tweet_params
    params.require(:tweet).permit(:text, :user_id, :uuid, images: [])
  end

  def auth_check
    raise '招待IDが無効です' if session[:invite_id].nil?
  end

  def twitter_client(user)
    Twitter::REST::Client.new do |config|
      config.consumer_key = ENV['TWITTER_KEY']
      config.consumer_secret = ENV['TWITTER_SECRET']
      config.access_token = user.token
      config.access_token_secret = user.secret
    end
  end
end
