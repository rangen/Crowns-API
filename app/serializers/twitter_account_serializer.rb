class TwitterAccountSerializer
  include FastJsonapi::ObjectSerializer
  attributes :handle, :use, :tweet_count
  belongs_to :politician
end
