class Job < ApplicationRecord
  belongs_to :user
  has_many :worked_days


  #TODO: improve this to dynamic job week days
  def worked_week_days
    [1, 2, 3, 4, 5].map do |week_day_number|
      (Date.today.beginning_of_week..Date.today.end_of_week).to_a[week_day_number - 1]
    end
  end

  def worked_days_this_week
    days = worked_days.where(date: Date.today.beginning_of_week..Date.today)
    this_week = []
    worked_week_days.each do |date|
      this_week << (days.find { |day| day.date == date } || WorkedDay.new(date: date, hours: 0))
    end
    this_week
  end

  def hours_per_day
    hours_per_week / worked_week_days.count
  end

  def hours_this_week
    worked_days.this_week.pluck(:hours).sum
  end

  def hours_left_this_week
    hours_per_week - hours_this_week
  end
end
