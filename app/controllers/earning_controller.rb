class EarningController < ApplicationController
  before_action :authenticate_user!
  before_action :authenticate_current_user!
  before_action :set_user, only: [:show, :index,:earn,:target]
  before_action :set_monthly
  def index
    date=Date.today
    @year=date.year
    @month=date.month
    @earnings=Earning.where(user_id:@user.id).date_month(@year, @month)
    @attendance_left=@monthly.attendance_days-@earnings.group("DAY(date)").length
  end

  def show
  end

  def target
    date=Date.today
    if @monthly.present? then
      Earning.create!(user_id:@user.id,target:params[:target],date:date,monthly_id:@monthly.id)
      sum_target=@monthly.sum_target+params[:target].to_i
      @monthly.update!(sum_target:sum_target)
    else
      Monthly.create!(user_id:@user.id,year:date.year,month:date.month,sum_target:params[:target])
      Earning.create!(user_id:@user.id,target:params[:target],date:date,monthly_id:monthly.id)
    end
    flash[:notice] = "目標入力完了しました"
    redirect_to earning_index_path(@user.id)
  end

  def earn
    date=Date.today
    Earning.where(user_id:@user.id).last.update!(revenue:params[:revenue],cost:params[:cost])
    sum_cost=@monthly.sum_cost+params[:cost].to_i
    sum_earning=@monthly.sum_earning+params[:revenue].to_i
    @monthly.update!(sum_cost:sum_cost,sum_earning:sum_earning)
    flash[:notice] = "売上入力完了しました"
    redirect_to earning_index_path(@user.id)
  end


  private
  def set_user
    @user = User.find(params[:id])
  end
  def authenticate_current_user!
    if current_user.id!=params[:id].to_i then
      redirect_to home_index_path
    end
  end
  def set_monthly
    date=Date.today
    if Monthly.where(user_id:@user.id,year:date.year,month:date.month).present? then
      @monthly=Monthly.find_by(user_id:@user.id,year:date.year,month:date.month)
    end
  end
end
