module EarningHelper
  def targeted(user)
    if Earning.find_by(user_id:user.id).present? then
      last_earning=Earning.where(user_id:user.id).last
      if last_earning.revenue==0 then
        return true
      end
    end
  end
end
