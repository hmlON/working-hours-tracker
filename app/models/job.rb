class Job < ApplicationRecord
  belongs_to :user
  has_many :worked_days
end
