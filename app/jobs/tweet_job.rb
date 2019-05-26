class TweetJob < ApplicationJob
  queue_as :default

  def perform(*args)
    tweet = args[0]
    master_user = User.find(tweet.user_id)
    tc = twitter_client(master_user)

    tags = master_user.config.tag.name

    # Get Config from master_user
    tc.update("#{tweet.text} #{tags}")
    tweet.update(stat: 2) # 2 is tweeted
  rescue => e
    pp e
  end

  def twitter_client(master_user)
    Twitter::REST::Client.new do |config|
      config.consumer_key = ENV['TWITTER_KEY']
      config.consumer_secret = ENV['TWITTER_SECRET']
      config.access_token = master_user.token
      config.access_token_secret = master_user.secret
    end
  end
end
