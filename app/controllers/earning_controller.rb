class EarningController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: [:show, :index,:earn]
  def index
  end

  def show
  end

  def earn
    date=Date.today
    Earning.create!(user_id:@user.id,revenue:params[:revenue],date:date)
    redirect_to earning_index_path(@user.id)
  end

  private
  def set_user
    @user = User.find(params[:id])
  end
end
