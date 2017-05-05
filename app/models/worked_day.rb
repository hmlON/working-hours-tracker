class WorkedDay < ApplicationRecord
  belongs_to :job

  scope :this_week, -> { where(date: Date.today.beginning_of_week..Date.today) }
end
