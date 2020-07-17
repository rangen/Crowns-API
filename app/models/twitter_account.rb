class TwitterAccount < ApplicationRecord
    belongs_to :politician, polymorphic: true
    has_many :tweets
    has_many :mentioned_twitter_accounts, foreign_key: :mention_id, class_name: "UserMention"
    has_many :mentioners, through: :mentioned_twitter_accounts
    has_many :mentioner_twitter_accounts, foreign_key: :mentioner_id, class_name: "UserMention"
    has_many :mentions, through: :mentioner_twitter_accounts
    
    after_destroy :clear_user_mentions
    
    def num_tweets
        tweets.count
    end

private
    def clear_user_mentions
        UserMention.where(mention_id: self.id).or(UserMention.where(mentioner_id: self.id)).destroy_all
    end
end