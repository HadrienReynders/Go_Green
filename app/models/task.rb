class Task < ApplicationRecord
  has_many :select_tasks

  validates :title, :description, :exp, presence: true
end
