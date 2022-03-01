class GardensController < ApplicationController
  before_action :configure_permitted_parameters, if: :devise_controller?

  def index
    @gardens = Garden.all
  end
end
