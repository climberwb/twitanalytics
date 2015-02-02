json.array!(@tweets) do |tweet|
  json.extract! tweet, :id, :author, :title
  json.url tweet_url(tweet, format: :json)
end
