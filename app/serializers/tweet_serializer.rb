class TweetSerializer
  include JSONAPI::Serializer
  set_key_transform :camel_lower
  belongs_to :twitter_account

  attributes :snowflake_id, :created, :in_reply_to
end
