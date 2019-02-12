class HomeController < ApplicationController
  before_action :authenticate_user!, only: :index
  before_action :set_user
  def index
    if @user.is_admin then
      redirect_to admin_index_path
    end
    @attendances=Attendance.where(user_id:@user.id).order(:in_time)
    @earnings=Earning.where(user_id:@user.id).order(:date)
    @year=Date.today.year
    @month=Date.today.month
  end

  def search_month
    @attendances=Attendance.where(user_id:@user.id).date_month(params[:year],params[:month]).order(:in_time)
    @earnings=Earning.where(user_id:@user.id).date_month(params[:year], params[:month]).order(:date)
    @year=params[:year]
    @month=params[:month]
    render action: :index
  end
  private
  def set_user
    @user = User.find(current_user.id)
  end
end
