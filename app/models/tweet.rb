require 'twitter'
require 'dotenv'
require 'json'
require 'pry'
Dotenv.load


class Tweet < ActiveRecord::Base
  belongs_to :tweet_collection
def self.make_tweet
  @client ||= Twitter::REST::Client.new do |config|
        config.consumer_key        = ENV.fetch('twitter_consumer_key')
        config.consumer_secret     = ENV.fetch('twitter_secret_key')
      end
  @tweets = @client.search("#analytic", result_type: "recent", lang: "en").map do |tweet|
        { author: tweet.user.screen_name, text: tweet.text }
      end
  @tweets.each do |tweet|
    #@pulled_tweet = Tweet.new()
    @pulled_tweet = Tweet.create!(:author => tweet[:author].to_s, :title=>tweet[:text].to_s)
    @pulled_tweet.save
  end
end

 # if Tweet.last.created_at.to_s.split(' ')[0] != Time.now.to_s.split(' ')[0] 
    Tweet.make_tweet
  #end
end
#binding.pry
end
