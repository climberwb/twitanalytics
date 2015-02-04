class CreateTweetCollections < ActiveRecord::Migration
  def change
    create_table :tweet_collections do |t|

      t.timestamps
    end
  end
end
