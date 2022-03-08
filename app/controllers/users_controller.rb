class UsersController < ApplicationController
  def hydrate
    @user = User.find(params[:id])
    @user.status = 1
    @user.save
    redirect_back(fallback_location: root_path)
  end
end
