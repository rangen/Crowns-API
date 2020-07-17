class Rep < ApplicationRecord
    belongs_to :district
    has_one :state, through: :district
    has_many :twitter_accounts, as: :politician, dependent: :destroy

end