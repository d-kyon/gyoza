class MonthlyController < ApplicationController
  before_action :authenticate_user!
  before_action :authenticate_current_user!, except: [:edit, :delete,:setting]
  before_action :set_user, except: [:edit, :delete,:setting]

  def index
    @year=params[:year]
    @month=params[:month]
  end

  def setting
    @monthly=Monthly.find(params[:id])
    @user=@monthly.user
  end

  def set
      Monthly.create(user_id:@user.id,year:params[:year],month:params[:month],target_monthly:params[:target_monthly],attendance_days:params[:attendance_days])
      flash[:notice] = "目標入力完了しました"
      redirect_to earning_index_path(@user.id)
  end

  def edit
    Monthly.find(params[:monthly][:id]).update!(attendance_days:params[:monthly][:attendance_days],target_monthly:params[:monthly][:target_monthly])
    redirect_to report_index_path(current_user.id)
    flash[:notice] = "編集しました"
  end

  def delete
    Monthly.find(params[:id]).delete
    redirect_to report_index_path(current_user.id)
    flash[:notice] = "削除しました"
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
