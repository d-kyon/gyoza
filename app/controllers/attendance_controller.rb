class AttendanceController < ApplicationController
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
    Attendance.create!(user_id:@user.id,out_time:@time)
    redirect_to attendance_index_path(@user.id)
  end

  private
  def set_user
    @user = User.find(params[:id])
  end
  def set_time
    @time=Time.now+9*60*60
  end

end
