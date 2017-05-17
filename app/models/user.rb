class User < ApplicationRecord
  has_one :job

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def job?
    job.present?
  end
end
