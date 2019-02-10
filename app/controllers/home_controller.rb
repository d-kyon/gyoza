class HomeController < ApplicationController
  before_action :authenticate_user!, only: :index
  before_action :set_user
  def index
    if @user.is_admin then
      redirect_to admin_index_path
    end
  end
  private
  def set_user
    @user = User.find(current_user.id)
  end
end
