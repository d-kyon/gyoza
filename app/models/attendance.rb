class Attendance < ApplicationRecord
  belongs_to :user
  scope :date_between, -> from, to {
  if from.present? && to.present?
    where(in_time: from..to)
  elsif from.present?
    where('in_time >= ?', from)
  elsif to.present?
    where('in_time <= ?', to)
  end
}

scope :date_month, -> year, month {
  if year.present? && month.present?
    from = Date.new(year.to_i,month.to_i)
    one_month_later = from>>1
    to=one_month_later
    where(in_time: from..to)
  end
}
scope :date_month_20, -> year, month {
  if year.present? && month.present?
    date = Date.new(year.to_i,month.to_i,21)
    from = date << 1
    to=date-1
    where(in_time: from..to)
  end
}

end
