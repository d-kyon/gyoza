class HomeController < ApplicationController
  before_action :authenticate_user!, only: :index
  before_action :set_user
  def index
    if @user.is_admin then
      redirect_to admin_index_path
    end
    @year=Date.today.year
    @month=Date.today.month
    if !@attendances then
      @attendances=Attendance.where(user_id:@user.id).date_month(@year,@month).order(:in_time)
    end
    if !@earnings then
      @earnings=Earning.where(user_id:@user.id).date_month(@year, @month).order(:date)
    end

    @revenue_month=@earnings.group("DAY(date)").sum(:revenue)
    @cost_month=@earnings.group("DAY(date)").sum(:cost)
    @target_month=@earnings.group("DAY(date)").sum(:target)
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
