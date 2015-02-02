require 'twitter'
require 'dotenv'
require 'json'
require 'pry'
Dotenv.load
# @client ||= Twitter::REST::Client.new do |config|
#       config.consumer_key        = ENV.fetch('twitter_consumer_key')
#       config.consumer_secret     = ENV.fetch('twitter_secret_key')
#     end
# @tweets = @client.search("#analytic", result_type: "recent", lang: "en").map do |tweet|
#       { author: tweet.user.screen_name, text: tweet.text }
#     end
# @tweets.each do |tweet|
#   @pulled_tweet = Tweet.new()
#   @pulled_tweet.update_attributes(:author => tweet[:author].to_s, :title=>tweet[:title].to_s)
#   @pulled_tweet.save
# end
binding.pry

class Tweet < ActiveRecord::Base

  module TweetDigger
  extend self

  def process
    post_to_rails records_from_twitter
  end

private

  def post_to_rails(records)
    records.each do |tweet|
      `curl --data #{to_params(tweet)} #{rails_url}`
    end
  end

  def records_from_twitter
    @tweets = @client.search("#analytic", result_type: "recent", lang: "en").map do |tweet|
      { author: tweet.user.screen_name, text: tweet.text }
    end
  end

  def to_params(tweet)
    encoded = [tweet[:text], tweet[:author]].map do |to_encode|
      URI.escape(to_encode)
    end
    "\"tweet[text]=#{encoded[0]}&tweet[author]=#{encoded[1]}\""
  end


  def rails_url
    "http://#{ENV.fetch("host")}/tweets.json"
  end

  def client
    @client ||= Twitter::REST::Client.new do |config|
      config.consumer_key        = ENV.fetch('twitter_consumer_key')
      config.consumer_secret     = ENV.fetch('twitter_secret_key')
    end
  end

end
#binding.pry
#TweetDigger.process

end
