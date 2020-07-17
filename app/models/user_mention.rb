class UserMention < ApplicationRecord
    belongs_to :mention, class_name: 'TwitterAccount'
    belongs_to :mentioner, class_name: 'TwitterAccount'
end