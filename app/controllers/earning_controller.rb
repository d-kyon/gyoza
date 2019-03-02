class EarningController < ApplicationController
  before_action :authenticate_user!
  before_action :authenticate_current_user!
  before_action :set_user, only: [:show, :index,:earn]
  def index
    if params[:latitude].present? && params[:longitude].present? then
       flash[:notice] = "現在地を取得しました"
       @lat=params[:latitude]
       @lon=params[:longitude]
    end
  end

  def show
  end

  def earn
    date=Date.today
    Geocoder.configure(:language  => :ja,   :units => :km )
    lat=params[:latitude]
    lon=params[:longitude]
    address=Geocoder.address(lat+","+lon)
    Earning.create!(user_id:@user.id,revenue:params[:revenue],date:date,latitude:lat,longitude:lon,address:address)
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
