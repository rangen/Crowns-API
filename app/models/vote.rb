class Vote < ApplicationRecord
    belongs_to :caster, polymorphic: true
    belongs_to :issue
end