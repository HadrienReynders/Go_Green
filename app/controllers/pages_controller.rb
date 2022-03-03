class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home]

  def home
  end

  def dashboard
    @garden = Garden.find(params[:garden_id])
    @garden_users = GardenUser.all
    @users = User.all

    @select_tasks = SelectTask.all
    @completed_tasks = SelectTask.select {|task| task[:status] == true }.last(5).reverse
    @tasks = Task.all
  end
end
