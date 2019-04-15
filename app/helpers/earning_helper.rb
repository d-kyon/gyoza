module EarningHelper
  def targeted(user,date)
    if Earning.find_by(user_id:user.id,date:date).present? then
      earning=Earning.find_by(user_id:user.id,date:date)
      return earning.revenue==0 
    end
  end
end
