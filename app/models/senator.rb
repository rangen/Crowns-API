class Senator < ApplicationRecord
    belongs_to :state
    has_many :twitter_accounts, as: :politician, dependent: :destroy

    # def twitter_info
    #     twitter_accounts.map do |ta|
    #         {handle: ta.handle, use: ta.use, count: ta.num_tweets}
    #     end
    # end
end