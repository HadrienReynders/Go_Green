class Garden < ApplicationRecord
  belongs_to :user
  has_many :garden_users

  validates :name, presence: true
end
