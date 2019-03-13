class EarningController < ApplicationController
  before_action :authenticate_user!
  before_action :authenticate_current_user!
  before_action :set_user, only: [:show, :index,:earn,:target]
  def index
  end

  def show
  end

  def target
    date=Date.today
    Earning.create!(user_id:@user.id,target:params[:target],date:date)
    flash[:notice] = "目標入力完了しました"
    redirect_to earning_index_path(@user.id)
  end

  def earn
    date=Date.today
    Earning.where(user_id:@user.id).last.update!(revenue:params[:revenue],cost:params[:cost])
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
end
