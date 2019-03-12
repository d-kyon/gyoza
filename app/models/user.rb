class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :earning
  has_many :attendance
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
