class Tweet < ApplicationRecord
    belongs_to :twitter_account
     #add custom before_destroy to clear hashtag join records
end