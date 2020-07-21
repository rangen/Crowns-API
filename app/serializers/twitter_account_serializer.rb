class TwitterAccountSerializer
  include JSONAPI::Serializer
  set_key_transform :camel_lower
  belongs_to :politician

  attributes :handle, :use, :tweet_count

  attributes :tweets do |object|
    object.tweets.map do |tweet|
      {tweet_id: tweet.snowflake_id, in_reply_to: tweet.in_reply_to, created_at: tweet.created}
    end
  end
end
