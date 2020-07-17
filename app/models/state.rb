class State < ApplicationRecord
  has_many :senators
  has_many :districts
  has_many :reps, through: :districts
  has_one :cook_index, as: :location

  def primary_over?
      Date.today - primary_date > 0
  end

  def when_is_primary?
      days = (primary_date - Date.today).to_i
      return "#{name} primary is today" if days == 0

      if days > 0
        time = "from now"
        article = "is"
      else
        time = "ago"
        article = "was"
      end
      "#{name} primary #{article} #{days.abs} days #{time}"
  end
end