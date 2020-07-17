class TweetSerializer
  include FastJsonapi::ObjectSerializer
  attributes :snowflake_id, :created, :hashtags
  has_many :hashtags
end
