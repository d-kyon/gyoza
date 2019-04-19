class ReportController < ApplicationController
  before_action :authenticate_current_user!
  before_action :set_user, except: [:admin,:search_year_admin]
  # before_action :authenticate_monthly_target,only: :index

  def index
    @year=Date.today.year
    @earnings=Earning.where(user_id:@user.id).date_year(@year).order(:date)
    @monthlies = params[:year] ? Monthly.where(user_id:@user.id,year:params[:year]).order(:month) : Monthly.where(user_id:@user.id,year:@year).order(:month) ;
    respond_to do |format|
      format.html do
          #html用の処理を書
      end
      format.csv do
          #csv用の処理を書く
          send_data render_to_string, filename: "#{@user.username}-#{params[:year]}.csv", type: :csv
      end
    end
  end

  def show
  end
  def search_year
    @earnings=Earning.where(user_id:@user.id).date_year(params[:year]).order(:date)
    @year=params[:year]
    render action: :index
  end

  def admin
    if !@user.is_admin then
      redirect_to home_index_path(@user.id)
    end
    @user=User.find(current_user.id)
    @year=Date.today.year
    if !@earnings then
      @earnings=Earning.all.date_year(@year).order(:date)
    end
  end

  def search_year_admin
    @earnings=Earning.all.date_year(params[:year]).order(:date)
    @year=params[:year]
    render action: :admin
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
