class AttendanceController < ApplicationController
  before_action :authenticate_user!
  before_action :authenticate_current_user!
  before_action :set_user, only: [:show, :index,:in_time,:out_time]
  before_action :set_time, only: [:in_time, :out_time]
  before_action :authenticate_monthly_target,only: :index
  def index
    if params[:latitude].present? && params[:longitude].present? then
       flash[:notice] = "現在地を取得しました"
       @lat=params[:latitude]
       @lon=params[:longitude]
    end
  end

  def show
  end

  def in_time
    Geocoder.configure(:language  => :ja,   :units => :km )
    lat=params[:latitude]
    lon=params[:longitude]
    address=Geocoder.address(lat+","+lon)
    Attendance.create!(user_id:@user.id,in_time:@time,latitude:lat,longitude:lon,address:address)
    flash[:notice] = "出勤しました"
    redirect_to attendance_index_path(@user.id)
  end

  def out_time
    Attendance.where(user_id:@user.id).last.update!(out_time:@time)
    flash[:notice] = "退勤しました"
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
