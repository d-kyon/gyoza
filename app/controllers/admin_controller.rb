class AdminController < ApplicationController
  before_action :set_user
  before_action :authenticate_user!
  before_action :authenticate_admin!
  def index
  end

  def show
  end

  def attendance
  end

  def earning
  end

  private
  def set_user
    @user = User.find(current_user.id)
  end

  def authenticate_admin!
    if !@user.is_admin then
      redirect_to home_index_path
    end
  end

end
