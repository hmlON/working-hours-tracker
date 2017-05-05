class User < ApplicationRecord
  has_one :job

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
