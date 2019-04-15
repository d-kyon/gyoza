class HomeController < ApplicationController
  before_action :authenticate_user!, only: :index
  before_action :authenticate_current_user!,except: :admin
  before_action :set_user
  # before_action :authenticate_monthly_target,only: :index
  def index
    @year=Date.today.year
    @month=Date.today.month
    if !@attendances then
      @attendances=Attendance.where(user_id:@user.id).date_month(@year,@month).order(:in_time)
    end
    if !@earnings then
      @earnings=Earning.where(user_id:@user.id).date_month(@year, @month).order(:date)
    end
  end

  def search_month
    @attendances=Attendance.where(user_id:@user.id).date_month(params[:year],params[:month]).order(:in_time)
    @earnings=Earning.where(user_id:@user.id).date_month(params[:year], params[:month]).order(:date)
    @year=params[:year]
    @month=params[:month]
    render action: :index
  end

  def admin
    if !@user.is_admin then
      redirect_to home_index_path(@user.id)
    end
    @year=Date.today.year
    @month=Date.today.month
    if !@earnings then
      @earnings=Earning.all.date_month(@year, @month).order(:date)
    end
  end

  def search_month_admin
    @year=params[:year]
    @month=params[:month]
    @earnings=Earning.all.date_month(params[:year], params[:month]).order(:date)
    render action: :admin
  end
  private
  def set_user
    if params[:id].nil? then
      @user = User.find(current_user.id)
    else
      @user= User.find(params[:id])
    end
  end
  def authenticate_current_user!
    if !current_user.is_admin then
      if current_user.id!=params[:id].to_i then
        redirect_to home_index_path(current_user.id)
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
