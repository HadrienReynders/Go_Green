class GardenUsersController < ApplicationController
  before_action :configure_permitted_parameters, if: :devise_controller?

  def index
    @garden = Garden.find(params[:garden_id])
    @garden_users = GardenUser.all
    @users = User.all

  end
end
