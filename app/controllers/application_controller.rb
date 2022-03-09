class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  def after_sign_in_path_for(resource)
    stored_location_for(resource) || dashboard_path(garden_id: GardenUser.order(garden_id: :asc).find { |gardenuser| gardenuser.user_id == current_user.id }.garden_id)
  end
end
