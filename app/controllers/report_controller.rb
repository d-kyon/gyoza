class ReportController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user

  def index
    @year=Date.today.year
    if !@earnings then
      @earnings=Earning.where(user_id:@user.id).date_year(@year).order(:date)
    end
    @revenue_month=@earnings.group("MONTH(date)").sum(:revenue)
    @cost_month=@earnings.group("MONTH(date)").sum(:cost)
    @target_month=@earnings.group("MONTH(date)").sum(:target)
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
    @user = User.find(current_user.id)
  end
end
