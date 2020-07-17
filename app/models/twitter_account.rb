class TwitterAccount < ApplicationRecord
    belongs_to :politician, polymorphic: true
    has_many :tweets
    
    def num_tweets
        tweets.count
    end

private
    def clear_user_mentions
        UserMention.where(mention_id: self.id).or(UserMention.where(mentioner_id: self.id)).destroy_all
    end
end