class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home]
  before_action :get_select_task, only: [:update, :destroy]

  def home
  end

  def dashboard
    @gardens = Garden.all
    @garden = Garden.find(params[:garden_id])
    @garden_users = GardenUser.all
    @users = User.all

    @select_tasks = SelectTask.all
    @completed_tasks = SelectTask.select {|task| task[:status] == true }.last(5).reverse
    @tasks = Task.all

    @gardens = Garden.all
    @select_task = SelectTask.new
    @tasks = Task.all

    # @user = User.find(user.id)
    @level = compute_lvl(current_user)
    @exp_lvl = exp_lvl(@level)
    @plant = plant_img(@level)

  end

  # private

  helper_method :compute_lvl, :plant_img, :exp_lvl, :status, :plant_type

  def compute_lvl(user)
    user_exp = user.exp
    const = 10
    Math.sqrt(user_exp / const)
  end

  def exp_lvl(level)
    percentage = level - level.floor
    (percentage * 100).round(2)
  end

  def plant_img(level)
    current_lvl = level.floor
      if current_lvl <= 8
        "bean/bean_#{current_lvl}.png"
      elsif 9 <= current_lvl && current_lvl <= 16
        "tomato/tomato_#{current_lvl - 8}.png"
      end
  end

  def status(user)
    if user.status == 0
      "Dead"
    elsif user.status == 1
      "Fine"
    else
      "Thirsty"
    end
  end

  def plant_type(user)
    current_lvl = compute_lvl(user).floor
    if current_lvl <= 8
      "Bean tree"
    elsif current_lvl >= 8
      "Tomato tree"
    end
  end

end
