class Monthly < ApplicationRecord
  belongs_to :user
  has_many :earning
end
