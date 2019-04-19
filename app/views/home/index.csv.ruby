require 'csv'

CSV.generate do |csv|
  column_values = ["","","",""]
  csv << column_values
  column_values = ["勤務詳細","","",""]
  csv << column_values
  column_names = %w(日付 出勤時間 退勤時間 住所)
  csv << column_names
  @attendances.each do |attendance|
    column_values = [
      attendance.in_time.try(:strftime, "%Y年%-m月%-d日(#{%w(日 月 火 水 木 金 土)[attendance.in_time.wday]})"),
      attendance.in_time.try(:strftime, "%H時%M分%S秒"),
      attendance.out_time.try(:strftime, "%H時%M分%S秒"),
      "#{attendance.address}"
    ]
    csv << column_values
  end
  column_values = ["","","",""]
  csv << column_values
  column_values = ["売上詳細","","",""]
  csv << column_values
  column_names = %w(日付 目標売上 売上金額 目標との差  費用 利益)
  csv << column_names
  @earnings.each do |earning|
    column_values = [
      earning.date,
      "#{earning.revenue}円",
      "#{earning.target}円",
      "#{earning.revenue-earning.target}円",
      "#{earning.daily_cost}円",
      "#{earning.revenue-earning.daily_cost}円"
    ]
    csv << column_values
  end
end
