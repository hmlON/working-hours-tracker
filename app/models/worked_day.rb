class WorkedDay < ApplicationRecord
  belongs_to :job

  validates :hours, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 24 }

  scope :this_week, -> { where(date: Date.today.beginning_of_week..Date.today) }

  def week_day
    date.strftime('%a')
  end

  def today?
    date == Date.current
  end

  def today_css_class
    "today" if today?
  end
end
