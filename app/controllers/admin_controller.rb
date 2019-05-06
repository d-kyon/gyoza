class AdminController < ApplicationController
  before_action :set_user
  before_action :set_employee,only: [:show,:attendance,:earning,:earning_between,
                                      :attendance_between,:search_month,
                                      :attendance_search_month ,:earning_search_month,:user]
  before_action :authenticate_admin!
  # before_action :authenticate_monthly_target,only: :index
  def index
    @employees=User.all
  end

  def show
  @year=Date.today.year
  @month=Date.today.month
    if !@attendances then
      @attendances=Attendance.where(user_id:@employee.id).date_month_20(@year,@month).order(:in_time)
    end
    if !@earnings then
      @earnings=Earning.where(user_id:@employee.id).date_month_20(@year,@month).order(:date)
    end
  end

  def attendance
    @year=Date.today.year
    @month=Date.today.month
    if !@attendances then
      @attendances=Attendance.where(user_id:@employee.id).date_month_20(@year,@month).order(:in_time)
    end
  end

  def attendance_search_month
    @attendances=Attendance.where(user_id:@employee.id).date_month_20(params[:year],params[:month]).order(:in_time)
    @year=params[:year]
    @month=params[:month]
    render action: :attendance
  end

  def search_month
    @attendances=Attendance.where(user_id:@employee.id).date_month_20(params[:year],params[:month]).order(:in_time)
    @earnings=Earning.where(user_id:@employee.id).date_month_20(params[:year], params[:month]).order(:date)
    @year=params[:year]
    @month=params[:month]
    render action: :show
  end

  def earning
    @year=Date.today.year
    @month=Date.today.month
    if !@earnings then
      @earnings=Earning.where(user_id:@employee.id).date_month_20(@year,@month).order(:date)
    end
  end

  def earning_search_month
    @earnings=Earning.where(user_id:@employee.id).date_month_20(params[:year], params[:month]).order(:date)
    @year=params[:year]
    @month=params[:month]
    render action: :earning
  end

  def user
  end

  def user_edit
    employee=User.find(params[:user][:id])
    employee.update!(username:params[:user][:username],salary:params[:user][:salary])
    redirect_to admin_index_path(@user.id)
  end

  private
  def set_user
    @user = User.find(current_user.id)
  end
  def set_employee
    @employee = User.find(params[:id])
  end

  def authenticate_admin!
    if !@user.is_admin then
      redirect_to home_index_path(@user.id)
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
