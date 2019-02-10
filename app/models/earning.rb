class Earning < ApplicationRecord
  scope :date_between, -> from, to {
  if from.present? && to.present?
    where(date: from..to)
  elsif from.present?
    where('date >= ?', from)
  elsif to.present?
    where('date <= ?', to)
  end
}
scope :date_month, -> year, month {
  from = Date.new(year,month)
  one_month_later = from>>1
  to=one_month_later-1
  where(in_time: from..to)
}
end
