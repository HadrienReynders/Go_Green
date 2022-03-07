class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :select_tasks
  has_many :tasks, through: :select_tasks
  has_many :gardens, through: :garden_users

  validates :first_name, :last_name, :exp, :seed_kind, :status, :plant_url, :avatar_url, presence: true

  after_commit :async_update # Run on create & update

  private

  def async_update
    DeleteUserSelectedTask.perform_later(self)
  end

end
