class AdminController < ApplicationController
  before_action :set_user
  before_action :set_employee,only: [:show,:attendance,:earning]
  before_action :authenticate_user!
  before_action :authenticate_admin!
  def index
    @employees=User.all
  end

  def show
  end

  def attendance
    @attendances=Attendance.where(user_id:@employee.id)
  end

  def earning
    @earnings=Earning.all
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
