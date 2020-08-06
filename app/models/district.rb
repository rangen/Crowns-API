class District < ApplicationRecord
    belongs_to :state
    has_many :reps
    has_one :cook_index, as: :location
    has_many :webhits

    def full_name
        case number.to_i
        when 0
            num = "At Large"
        when 1, 21, 31, 41, 51
            num = number + "st"
        when 2, 22, 32, 42, 52
            num = number + "nd"
        when 3, 23, 33, 43, 53
            num = number + "rd"
        else
            num = number + "th"
        end
        "#{state.name}'s #{num} District"
    end
end