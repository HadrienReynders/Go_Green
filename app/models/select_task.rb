class SelectTask < ApplicationRecord
  belongs_to :user
  belongs_to :task

  validates :status, presence: true
end
