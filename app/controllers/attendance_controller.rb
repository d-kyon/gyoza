class AttendanceController < ApplicationController
  before_action :authenticate_user!
  before_action :authenticate_current_user!
  before_action :set_user, only: [:show, :index,:in_time,:out_time]
  before_action :set_time, only: [:in_time, :out_time]
  def index
  end

  def show
  end

  def in_time
    Attendance.create!(user_id:@user.id,in_time:@time)
    redirect_to attendance_index_path(@user.id)
  end

  def out_time
    Attendance.where(user_id:@user.id).last.update!(out_time:@time)
    redirect_to attendance_index_path(@user.id)
  end

  private
  def set_user
    @user = User.find(params[:id])
  end
  def set_time
    @time=Time.now+9*60*60
  end
  def authenticate_current_user!
    if current_user.id!=params[:id].to_i then
      redirect_to home_index_path
    end
  end

end
