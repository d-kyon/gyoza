class Cost < ApplicationRecord
  belongs_to :user
  belongs_to :earning, optional: true
  # , dependent: :destroy
end
