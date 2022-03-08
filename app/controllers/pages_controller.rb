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


    @user = User.find_by_id(params[:user_id]) || current_user

    @level = compute_lvl(current_user)
    @exp_lvl = exp_lvl(@level)
    # @plant = plant_img(@level)

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

  def plant_img(level, user)
    current_lvl = level.floor
    if user.status == 1
      if current_lvl <= 8
        "bean/bean_#{current_lvl}.png"
      elsif 9 <= current_lvl && current_lvl <= 16
        "tomato/tomato_#{current_lvl - 8}.png"
      end
    elsif user.status == 2
      if current_lvl <= 8
        "bean/bean_#{current_lvl}_wilts.png"
      elsif 9 <= current_lvl && current_lvl <= 16
        "tomato/tomato_#{current_lvl - 8}_wilts.png"
      end
    else
        "dead.png"
    end
  end

  def status(user)
    if user.status == 1
      "Fine"
    elsif user.status == 2
      "Thirsty"
    else
      "Dead"
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
