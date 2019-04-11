class MonthlyController < ApplicationController
  before_action :authenticate_user!
  before_action :authenticate_current_user!
  before_action :set_user



  def index
    date=Date.today
    @year=date.year
    @month=date.month
    if Monthly.where(user_id:@user.id,year:params[:year],month:params[:month]).present? then
      
  end

  def set
    if Monthly.where(user_id:@user.id,year:params[:year],month:params[:month]).present? then
      Monthly.where(user_id:@user.id,year:params[:year],month:params[:month]).last.update!(
      target_monthly:params[:target_monthly],
      attendance_days:params[:attendance_days])
    else
      Monthly.create(user_id:@user.id,year:params[:year],month:params[:month],target_monthly:params[:target_monthly],attendance_days:params[:attendance_days])
    end
    flash[:notice] = "目標入力完了しました"
    redirect_to monthly_index_path(@user.id)
  end





  private
  def set_user
    @user = User.find(params[:id])
  end
  def authenticate_current_user!
    if current_user.id!=params[:id].to_i then
      redirect_to monthly_index_path
    end
  end
end
