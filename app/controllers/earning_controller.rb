class EarningController < ApplicationController
  before_action :authenticate_current_user!, except: [:edit, :delete,:setting,:show]
  before_action :set_user, only: [:index,:earn,:target]
  before_action :set_monthly,except: [:edit,:delete,:setting,:show]
  # before_action :authenticate_monthly_target,only: :index
  def index
    @date=Date.today
    @year=@date.year
    @month=@date.month
    @earnings=Earning.where(user_id:@user.id).date_month(@year, @month)
    if @monthly then
      @attendance_left=@monthly.attendance_days-@earnings.length
    end
  end

  def show
    @earning=Earning.find(params[:id])
    @user=@earning.user
    @cost=Cost.find_by(earning_id:params[:id])
  end

  def setting
    @earning=Earning.find(params[:id])
    @user=@earning.user
  end


  def edit
    @earning=Earning.find(params[:earning][:id])
    @user=@earning.user
    Earning.find(params[:earning][:id]).update!(target:params[:earning][:target],revenue:params[:earning][:revenue])
    date=Date.today
    @monthly=Monthly.find_by(user_id:@user.id,year:date.year,month:date.month)
    sum_target=@monthly.earning.sum{|hash| hash[:target]}
    sum_earning=@monthly.earning.sum{|hash| hash[:revenue]}
    @monthly.update!(sum_target:sum_target,sum_earning:sum_earning)
    redirect_to home_index_path(current_user.id)
    flash[:notice] = "編集しました"
  end

  def delete
    @earning=Earning.find(params[:id])
    @user=@earning.user
    date=Date.today
    @monthly=Monthly.find_by(user_id:@user.id,year:date.year,month:date.month)
    Earning.find(params[:id]).destroy!
    sum_target=@monthly.earning.sum{|hash| hash[:target]}
    sum_earning=@monthly.earning.sum{|hash| hash[:revenue]}
    sum_cost=@monthly.earning.sum{|hash| hash[:daily_cost]}
    @monthly.update!(sum_target:sum_target,sum_earning:sum_earning,sum_cost:sum_cost)
    redirect_to home_index_path(current_user.id)
    flash[:notice] = "削除しました"
  end

  def target
    date=Date.today
    if @monthly.present? then
      Earning.create!(user_id:@user.id,target:params[:target],date:date,monthly_id:@monthly.id)
      sum_target=@monthly.earning.sum{|hash| hash[:revenue]}
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
    earning=Earning.find_by(user_id:@user.id,date:date)
    cost=[params[:travel_cost].to_i,params[:accommodation].to_i,params[:buying_price].to_i,
          params[:for_tasting].to_i,params[:fixtures].to_i,params[:others].to_i].sum
    cost_date=Cost.create!(user_id:@user.id,earning_id:earning.id,travel_cost:params[:travel_cost],
                  accommodation:params[:accommodation],buying_price:params[:buying_price],
                  for_tasting:params[:for_tasting],fixtures:params[:fixtures],others:params[:others]
                )
    earning.update!(user_id:@user.id,date:date,revenue:params[:revenue],daily_cost:cost)
    sum_cost=@monthly.earning.sum{|hash| hash[:cost]}
    sum_earning=@monthly.earning.sum{|hash| hash[:earning]}
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
