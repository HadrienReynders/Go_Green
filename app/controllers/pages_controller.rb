class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
  end

  def dashboard
    @garden = Garden.find(params[:garden_id])
    @garden_users = GardenUser.all
    @users = User.all

    @select_tasks = SelectTask.all
    @tasks = Task.all
  end

end
