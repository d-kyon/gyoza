module ApplicationHelper
  def working_hour(in_time,out_time)
    sec=out_time-in_time
    (Time.parse("1/1") + (sec)).strftime("%H時間%M分%S秒")
  end
end
