class HomeController < ApplicationController
  before_action :authenticate_current_user!,except: :admin
  before_action :set_user
  # before_action :authenticate_monthly_target,only: :index
  def index
    @year=Date.today.year
    @month=Date.today.month
    @attendances= params[:year] ? Attendance.where(user_id:@user.id).date_month_20(params[:year],params[:month]).order(:in_time) : Attendance.where(user_id:@user.id).date_month_20(@year,@month).order(:in_time) ;
    @earnings= params[:year] ? Earning.where(user_id:@user.id).date_month_20(params[:year], params[:month]).order(:date) : Earning.where(user_id:@user.id).date_month_20(@year, @month).order(:date) ;
    respond_to do |format|
      format.html do
          #html用の処理を書
      end
      format.csv do
          #csv用の処理を書く
          send_data render_to_string, filename: "#{@user.username}-#{params[:year]}-#{params[:month]}.csv", type: :csv
      end
    end
  end

  def search_month
    @attendances=Attendance.where(user_id:@user.id).date_month_20(params[:year],params[:month]).order(:in_time)
    @earnings=Earning.where(user_id:@user.id).date_month_20(params[:year], params[:month]).order(:date)
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
      @earnings=Earning.all.date_month_20(@year, @month).order(:date)
    end
  end

  def search_month_admin
    @year=params[:year]
    @month=params[:month]
    @earnings=Earning.all.date_month_20(params[:year], params[:month]).order(:date)
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
