module HomeHelper
  def day_sum(user,year,month,day)
      date=year.to_s+"-"+month.to_s+"-"+day.to_s
      earning=Earning.where(user_id:user.id,date:date)
      return earning
  end

  def day_revenue(user,year,month,day)
    earning=day_sum(user,year,month,day)
    return earning.sum(:revenue)
  end
  def day_target(user,year,month,day)
    earning=day_sum(user,year,month,day)
    return earning.sum(:target)
  end
  def day_cost(user,year,month,day)
    earning=day_sum(user,year,month,day)
    return earning.sum(:cost)
  end
end
