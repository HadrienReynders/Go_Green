class GardenUser < ApplicationRecord
  belongs_to :garden
  belongs_to :user
end
