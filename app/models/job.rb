class Job < ApplicationRecord
  belongs_to :user
  has_many :worked_days

  def week_day_numbers
    [1, 2, 3, 4, 5]
  end

  def hours_per_day
    hours_per_week / week_day_numbers.count
  end

  def hours_this_week
    worked_days.this_week.pluck(:hours).sum
  end

  def hours_left_this_week
    hours_per_week - hours_this_week
  end
end
