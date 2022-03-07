class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  def after_sign_in_path_for(resource)
    stored_location_for(resource) || dashboard_path(garden_id: Garden.first.id)
  end
end
