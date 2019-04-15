module HomeHelper
  def day_sum(user,year,month,day)
      date=year.to_s+"-"+month.to_s+"-"+day.to_s
      earning=Earning.where(user_id:user.id,date:date)
      return earning
  end

  def daily_earning(user,earnings,year,month,day)
     date=Date.new(year.to_i,month.to_i,day)
    if Earning.find_by(date:date,user:user) then
      return Earning.find_by(date:date,user:user)
    end
  end

  def target(earning)
    target = earning ? earning.target : 0 ;
  end

  def revenue(earning)
    revenue = earning ? earning.revenue : 0 ;
  end

  def profit(earning)
    profit = earning ? earning.revenue-earning.daily_cost : 0 ;
  end

  def achievement(earning)
    achievement = earning ? earning.revenue-earning.target : 0 ;
  end

  def cost(earning)
    cost = earning ? earning.daily_cost : 0 ;
  end

  def last_day(year,month)
    next_first_day=Date.new(year.to_i,month.to_i,1).next_month
    return (next_first_day-1).day
  end

  def monthly(user,year,month)
    if Monthly.find_by(user:user,year:year,month:month) then
      monthly=Monthly.find_by(user:user,year:year,month:month)
    end
  end

  def sum_target(monthly)
    sum_target = monthly ? monthly.sum_target : 0 ;
  end

  def target_monthly(monthly)
    target_monthly = monthly ? monthly.target_monthly : 0 ;
  end

  def sum_cost(monthly)
    sum_cost = monthly ? monthly.sum_cost : 0 ;
  end

  def sum_earning(monthly)
    sum_earning = monthly ? monthly.sum_earning : 0 ;
  end

  def attendance_days(monthly)
    attendance_days = monthly ? monthly.attendance_days : 0 ;
  end

  def achievement_monthly(monthly)
    achievement = monthly ? monthly.sum_earning-monthly.target_monthly : 0 ;
  end

  def sum_profit(monthly)
    profit = monthly ? monthly.sum_earning-monthly.sum_cost : 0 ;
  end
end
