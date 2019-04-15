module ReportHelper
  def monthly(user,year,month)
    if Monthly.find_by(user:user,year:year,month:month) then
      monthly=Monthly.find_by(user:user,year:year,month:month)
    end
  end

  def monthlies(year,month)
    if Monthly.where(year:year,month:month) then
      monthlies=Monthly.where(year:year,month:month)
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
