class AddTweetCollectionToTweets < ActiveRecord::Migration
  def change
    add_column :tweets, :tweet_collection_id, :integer
  end
end





