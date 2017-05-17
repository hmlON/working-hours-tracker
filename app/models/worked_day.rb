class WorkedDay < ApplicationRecord
  belongs_to :job

  scope :this_week, -> { where(date: Date.today.beginning_of_week..Date.today) }

  def week_day
    date.strftime('%a')
  end
end

class NotWorkedDay
  attr_reader :date

  def initialize(date)
    @date = date
  end

  def hours
    0
  end

  def week_day
    date.strftime('%a')
  end
end
