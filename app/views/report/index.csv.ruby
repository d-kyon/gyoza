require 'csv'

CSV.generate do |csv|
  column_names = %w(月 出勤日数 目標売上 売上金額 目標との差 費用 利益)
  csv << column_names
  @monthlies.each do |monthly|
    column_values = [
      "#{monthly.month}月",
      "#{monthly.attendance_days}日",
      "#{monthly.target_monthly}円",
      "#{monthly.sum_earning}円",
      "#{monthly.sum_earning-monthly.target_monthly}円",
      "-#{monthly.sum_cost}円",
      "#{monthly.sum_earning-monthly.sum_cost}円"
    ]
    csv << column_values
  end
end
