class Tweet < ApplicationRecord
    belongs_to :twitter_account
    has_and_belongs_to_many :hashtags #add custom before_destroy to clear hashtag join records
end