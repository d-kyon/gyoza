class CostController < ApplicationController
  before_action :authenticate_user!
  before_action :authenticate_current_user!, except: [:edit, :delete,:setting]
  before_action :set_user, only: [:show, :index,:earn,:target]
  before_action :set_monthly,except: [:edit, :delete,:setting]
  # before_action :authenticate_monthly_target,only: :index

  def setting
    @earning=Earning.find(params[:id])
    @cost=Cost.find_by(earning_id:@earning.id)
    @user=@earning.user
  end


    def edit
      @earning=Cost.find(params[:cost][:id]).earning
      @user=@earning.user
      Cost.find(params[:cost][:id]).update!(travel_cost:params[:cost][:travel_cost],accommodation:params[:cost][:accommodation],
        buying_price:params[:cost][:buying_price],for_tasting:params[:cost][:for_tasting],fixtures:params[:cost][:fixtures],others:params[:cost][:others])
      cost=[params[:cost][:travel_cost].to_i,params[:cost][:accommodation].to_i,params[:cost][:buying_price].to_i,
              params[:cost][:for_tasting].to_i,params[:cost][:fixtures].to_i,params[:cost][:others].to_i].sum
      @earning.update!(daily_cost:cost)
      date=@earning.date
      @monthly=Monthly.find_by(user_id:@user.id,year:date.year,month:date.month)
      sum_cost=@monthly.earning.sum{|hash| hash[:daily_cost]}
      @monthly.update!(sum_cost:sum_cost)
      redirect_to home_index_path(current_user.id)
      flash[:notice] = "編集しました"
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
