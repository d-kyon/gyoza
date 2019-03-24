class HomeController < ApplicationController
  before_action :authenticate_user!, only: :index
  before_action :authenticate_current_user!
  before_action :set_user
  before_action :authenticate_monthly_target,only: :index
  def index
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
  def authenticate_current_user!
    if !current_user.is_admin then
      if current_user.id!=params[:id].to_i then
        redirect_to home_index_path(@user.id)
      end
    end
  end
  def authenticate_monthly_target
    year=Date.today.year
    month=Date.today.month
    if Monthly.find_by(user_id:@user.id,year:year,month:month).nil? then
      flash[:notice] = "月間目標を入力してください"
      redirect_to monthly_index_path(@user.id)
    end
  end
end
