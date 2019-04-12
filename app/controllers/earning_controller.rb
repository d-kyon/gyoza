class EarningController < ApplicationController
  before_action :authenticate_user!
  before_action :authenticate_current_user!, except: [:edit, :delete,:setting]
  before_action :set_user, only: [:show, :index,:earn,:target]
  before_action :set_monthly,except: [:edit, :delete,:setting]
  before_action :authenticate_monthly_target,only: :index
  def index
    date=Date.today
    @year=date.year
    @month=date.month
    @earnings=Earning.where(user_id:@user.id).date_month(@year, @month)
    @attendance_left=@monthly.attendance_days-@earnings.length
  end

  def show
  end

  def setting
    @earning=Earning.find(params[:id])
    @user=@earning.user
  end


    def edit
      Earning.find(params[:earning][:id]).update!(target:params[:earning][:target],revenue:params[:earning][:revenue],cost:params[:earning][:cost])
      redirect_to home_index_path(current_user.id)
      flash[:notice] = "編集しました"
    end

    def delete
      Earning.find(params[:id]).delete
      redirect_to home_index_path(current_user.id)
      flash[:notice] = "削除しました"
    end

  def target
    date=Date.today
    if @monthly.present? then
      Earning.create!(user_id:@user.id,target:params[:target],date:date,monthly_id:@monthly.id)
      sum_target=@monthly.sum_target+params[:target].to_i
      @monthly.update!(sum_target:sum_target)
      flash[:notice] = "目標変更完了しました"
    else
      Monthly.create!(user_id:@user.id,year:date.year,month:date.month,sum_target:params[:target])
      Earning.create!(user_id:@user.id,target:params[:target],date:date,monthly_id:monthly.id)
      flash[:notice] = "目標入力完了しました"
    end
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
    if !current_user.is_admin then
      if current_user.id!=params[:id].to_i then
        redirect_to home_index_path(@user.id)
      end
    end
  end

  def set_monthly
    date=Date.today
    if Monthly.where(user_id:@user.id,year:date.year,month:date.month).present? then
      @monthly=Monthly.find_by(user_id:@user.id,year:date.year,month:date.month)
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
