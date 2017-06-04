class WorkedDay < ApplicationRecord
  belongs_to :job

  scope :this_week, -> { where(date: Date.today.beginning_of_week..Date.today) }

  def week_day
    date.strftime('%a')
  end
end
