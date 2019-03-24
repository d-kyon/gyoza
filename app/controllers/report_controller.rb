class ReportController < ApplicationController
  before_action :authenticate_user!
  before_action :authenticate_current_user!
  before_action :set_user
  before_action :authenticate_monthly_target,only: :index

  def index
    @year=Date.today.year
    if !@earnings then
      @earnings=Earning.where(user_id:@user.id).date_year(@year).order(:date)
    end
    @revenue_month=@earnings.group("MONTH(date)").sum(:revenue)
    @cost_month=@earnings.group("MONTH(date)").sum(:cost)
    @target_month=Monthly.find_by(user_id:@user.id)
  end

  def show
  end
  def search_year
    @earnings=Earning.where(user_id:@user.id).date_year(params[:year]).order(:date)
    @year=params[:year]
    @revenue_month=@earnings.group("MONTH(date)").sum(:revenue)
    @cost_month=@earnings.group("MONTH(date)").sum(:cost)
    @target_month=@earnings.group("MONTH(date)").sum(:target)
    render action: :index
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
  def authenticate_monthly_target
    year=Date.today.year
    month=Date.today.month
    if Monthly.find_by(user_id:@user.id,year:year,month:month).nil? then
      flash[:notice] = "月間目標を入力してください"
      redirect_to monthly_index_path(@user.id)
    end
  end
end
