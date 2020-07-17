class PoliticianSerializer
  include JSONAPI::Serializer
  set_key_transform :camel_lower
  has_many :twitter_accounts
  
  attributes :candidate_name, :party, :on_ballot, :photo_url, :id, :incumbent
end
