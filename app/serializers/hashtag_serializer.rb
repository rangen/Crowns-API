class HashtagSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :tweets
  has_many :tweets
end
