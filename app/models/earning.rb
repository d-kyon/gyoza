class Earning < ApplicationRecord
  belongs_to :user
  has_many :cost, dependent: :destroy
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
scope :date_month_20, -> year, month {
  if year.present? && month.present?
    date = Date.new(year.to_i,month.to_i,21)
    from = date << 1
    to=date-1
    where(date: from..to)
  end
}
scope :date_year, -> year {
  if year.present?
    from = Date.new(year.to_i)
    to=from.next_year-1
    where(date: from..to)
  end
}
end
