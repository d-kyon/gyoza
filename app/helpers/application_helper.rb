module ApplicationHelper
  def working_hour(in_time,out_time)
    if out_time.present? then
      sec=out_time-in_time
      (Time.parse("1/1") + (sec)).strftime("%H時間%M分%S秒")
    end
  end

  def sum_working_hour(attendances)
    sum=0
    attendances.each do |attendance|
      if attendance.out_time.present? then
        working_hour=attendance.out_time-attendance.in_time
        sum+=working_hour
      end
    end
    (Time.parse("1/1") + (sum)).strftime("%H時間%M分%S秒")
  end
end
