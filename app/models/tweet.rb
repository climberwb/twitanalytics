

class Tweet < ActiveRecord::Base
  belongs_to :tweet_collection

  def self.client
    @client ||= Twitter::REST::Client.new do |config|
      config.consumer_key        = ENV['TWITTER_CONSUMER_KEY'] 
      config.consumer_secret     = ENV['TWITTER_SECRET_KEY']
    end
  end  

  def self.tweets
    client.search("#analytics", result_type: "recent", lang: "en").take(500).map do |tweet|
      Tweet.new(:author => tweet.user.screen_name.to_s, :title => tweet.text.to_s)
    end
  end


 
end
