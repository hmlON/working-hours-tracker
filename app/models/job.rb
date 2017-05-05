class Job < ApplicationRecord
  belongs_to :user
  has_many :worked_days

  WORKED_DAYS_COUNT = 5

  def hours_per_day
    hours_per_week / WORKED_DAYS_COUNT
  end
end
