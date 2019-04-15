class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :earning
  has_many :attendance
  has_many :monthly
  has_many :costs
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
