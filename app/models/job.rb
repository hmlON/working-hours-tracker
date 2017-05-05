class Job < ApplicationRecord
  belongs_to :user
  has_many :worked_days

  WORKED_DAYS_COUNT = 5

  def hours_per_day
    hours_per_week / WORKED_DAYS_COUNT
  end

  def hours_this_week
    worked_days.this_week.pluck(:hours).sum
  end

  def hours_left_this_week
    hours_per_week - hours_this_week
  end
end
