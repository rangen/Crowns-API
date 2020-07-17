class TwitterAccountSerializer
  include JSONAPI::Serializer
  set_key_transform :camel_lower
  belongs_to :politician
  has_many :tweets

  attributes :handle, :use, :tweet_count
end
