class SavedUserProfile < ApplicationRecord
    validates :passphrase, uniqueness: :true
    
end