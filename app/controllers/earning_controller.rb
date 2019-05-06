class EarningController < ApplicationController
  before_action :authenticate_current_user!, except: [:edit, :delete,:setting,:show]
  before_action :set_user, only: [:index,:earn,:target]
  before_action :set_monthly,except: [:edit,:delete,:setting,:show]
  # before_action :authenticate_monthly_target,only: :index
  def index
    if params[:date].present? then
      @date=Date.parse(params[:date])
    else
      @date=Date.today
    end
    @year=@date.year
    @month=@date.month
    if @date.day > 20 then
      @year = (@date>>1).year
      @month = (@date>>1).month
    end
    @earnings=Earning.where(user_id:@user.id).date_month_20(@year, @month)
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
    Earning.find(params[:earning][:id]).update!(target:params[:earning][:target],revenue:params[:earning][:revenue],
      expenses_image:params[:earning][:expenses_image],ordering_image:params[:earning][:ordering_image],others_image:params[:earning][:others_image])
    date=@earning.date
    if date.day > 20 then
      date=date >> 1
    end
    @monthly=Monthly.find_by(user_id:@user.id,year:date.year,month:date.month)
    sum_target=@monthly.earning.sum{|hash| hash[:target]}
    sum_earning=@monthly.earning.sum{|hash| hash[:revenue]}
    @monthly.update!(sum_target:sum_target,sum_earning:sum_earning)
    redirect_to home_search_month_path(id:@user.id,year:date.year,month:date.month)
    flash[:notice] = "編集しました"
  end

  def delete
    @earning=Earning.find(params[:id])
    @user=@earning.user
    date=@earning.date
    if date.day > 20 then
      date=date >> 1
    end
    @monthly=Monthly.find_by(user_id:@user.id,year:date.year,month:date.month)
    Earning.find(params[:id]).destroy
    sum_target=@monthly.earning.sum{|hash| hash[:target]}
    sum_earning=@monthly.earning.sum{|hash| hash[:revenue]}
    sum_cost=@monthly.earning.sum{|hash| hash[:daily_cost]}
    @monthly.update!(sum_target:sum_target,sum_earning:sum_earning,sum_cost:sum_cost)
    redirect_to home_search_month_path(id:@user.id,year:date.year,month:date.month)
    flash[:notice] = "削除しました"
  end

  def target
    date=Date.parse(params[:date])
    if @monthly.present? then
      Earning.create!(user_id:@user.id,target:params[:target],date:date,monthly_id:@monthly.id)
      sum_target=@monthly.earning.sum{|hash| hash[:revenue]}
      @monthly.update!(sum_target:sum_target)
      flash[:notice] = "目標入力完了しました"
    else
      if date.day > 20 then
        month = (date >> 1).month
      end
      Monthly.create!(user_id:@user.id,year:date.year,month:month,sum_target:params[:target])
      Earning.create!(user_id:@user.id,target:params[:target],date:date,monthly_id:monthly.id)
      flash[:notice] = "目標入力完了しました"
    end
    redirect_to earning_index_path(@user.id)
  end

  def earn
    date=Date.parse(params[:date])
    earning=Earning.find_by(user_id:@user.id,date:params[:date])
    if @monthly.present? then
      if earning.nil? then
        Earning.create!(user_id:@user.id,target:0,date:date,monthly_id:@monthly.id)
      end
    else
      monthly=Monthly.create!(user_id:@user.id,year:@year,month:@month,sum_target:0)
      if earning.nil? then
        Earning.create!(user_id:@user.id,target:0,date:date,monthly_id:monthly.id)
      end
    end
    earning=Earning.find_by(user_id:@user.id,date:date)
    cost=[params[:travel_cost].to_i,params[:accommodation].to_i,params[:buying_price].to_i,
          params[:for_tasting].to_i,params[:fixtures].to_i,params[:others].to_i].sum
    cost_date=Cost.create!(user_id:@user.id,earning_id:earning.id,travel_cost:params[:travel_cost],
                  accommodation:params[:accommodation],buying_price:params[:buying_price],
                  for_tasting:params[:for_tasting],fixtures:params[:fixtures],others:params[:others]
                )
    earning.update!(user_id:@user.id,date:date,revenue:params[:revenue],daily_cost:cost)
    sum_cost=@monthly.earning.sum{|hash| hash[:daily_cost]}
    sum_earning=@monthly.earning.sum{|hash| hash[:revenue]}
    @monthly.update!(sum_cost:sum_cost,sum_earning:sum_earning)
    month=date.month
    year=date.year
    if date.day > 20 then
      month = (date >> 1).month
      year = (date >> 1).year
    end
    earning.update!(expenses_image:params[:expenses_image],ordering_image:params[:ordering_image],others_image:params[:others_image])
    flash[:notice] = "売上入力完了しました"
    redirect_to home_search_month_path(id:@user.id,year:year,month:month)
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
    if params[:date].present? then
      date=Date.parse(params[:date])
    else
      date=Date.today
    end
    year=date.year
    month=date.month
    if date.day > 20 then
      year=(date>>1).year
      month=(date>>1).month
    end
    if Monthly.where(user_id:@user.id,year:year,month:month).present? then
      @monthly=Monthly.find_by(user_id:@user.id,year:year,month:month)
    end
  end
  # def authenticate_monthly_target
  #   if params[:date].present? then
  #     date=Date.parse(params[:date])
  #   else
  #     date=Date.today
  #   end
  #   if date.day > 20 then
  #     date = date >> 1
  #   end
  #   if Monthly.find_by(user_id:@user.id,year:date.year,month:date.month).nil? then
  #     flash[:notice] = "月間目標を入力してください"
  #     redirect_to monthly_index_path(@user.id)
  #   end
  # end
end
