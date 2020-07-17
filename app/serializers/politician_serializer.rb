class PoliticianSerializer
  include FastJsonapi::ObjectSerializer
  attributes :candidate_name, :party, :on_ballot, :photo_url, :id, :incumbent
  has_many :twitter_accounts
  
end
