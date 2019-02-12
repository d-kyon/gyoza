class AdminController < ApplicationController
  before_action :set_user
  before_action :set_employee,only: [:show,:attendance,:earning,:earning_between,:attendance_between,:search_month]
  before_action :authenticate_user!
  before_action :authenticate_admin!
  def index
    @employees=User.all
  end

  def show
    if !@attendances then
      @attendances=Attendance.where(user_id:@employee.id).order(:in_time)
    end
    if !@earnings then
      @earnings=Earning.where(user_id:@employee.id).order(:date)
    end
    @year=Date.today.year
    @month=Date.today.month
  end

  def attendance
    if !@attendances then
      @attendances=Attendance.where(user_id:@employee.id).order(:in_time)
    end
  end

  def attendance_search_month
    @attendances=Attendance.where(user_id:@employee.id).date_month(params[:year],params[:month]).order(:in_time)
    @year=params[:year]
    @month=params[:month]
    render action: :attendance
  end

  def search_month
    @attendances=Attendance.where(user_id:@employee.id).date_month(params[:year],params[:month]).order(:in_time)
    @earnings=Earning.where(user_id:@employee.id).date_month(params[:year], params[:month]).order(:date)
    @year=params[:year]
    @month=params[:month]
    render action: :show
  end

  def earning
    if !@earnings then
      @earnings=Earning.where(user_id:@employee.id).order(:date)
    end
  end

  def earning_search_month
    @earnings=Earning.where(user_id:@employee.id).date_month(params[:year], params[:month]).order(:date)
    @year=params[:year]
    @month=params[:month]
    render action: :earning
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
      redirect_to home_index_path
    end
  end

end
