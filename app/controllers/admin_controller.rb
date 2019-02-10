class AdminController < ApplicationController
  before_action :set_user
  before_action :set_employee,only: [:show,:attendance,:earning,:earning_between,:attendance_between]
  before_action :authenticate_user!
  before_action :authenticate_admin!
  def index
    @employees=User.all
  end

  def show
  end

  def attendance
    if !@attendances then
      @attendances=Attendance.where(user_id:@employee.id)
    end
  end

  def attendance_between
    @attendances=Attendance.where(user_id:@employee.id).date_between(params[:from], params[:to])
    render action: :attendance
  end

  def earning
    if !@earnings then
      @earnings=Earning.where(user_id:@employee.id)
    end
  end

  def earning_between
    @earnings=Earning.where(user_id:@employee.id).date_between(params[:from], params[:to])
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
