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
  if year.present? && month.present?
    from = Date.new(year.to_i,month.to_i)
    one_month_later = from>>1
    to=one_month_later-1
    where(date: from..to)
  end
}
end
