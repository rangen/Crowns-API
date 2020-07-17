class CookIndex < ApplicationRecord
    belongs_to :location, polymorphic: true
end