json.array!(@tweet_collections) do |tweet_collection|
  json.extract! tweet_collection, :id
  json.url tweet_collection_url(tweet_collection, format: :json)
end
