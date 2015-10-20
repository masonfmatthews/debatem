class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :recoverable,
  # :rememberable, :trackable, and :omniauthable
  devise :database_authenticatable, :registerable, :validatable

  has_many :proposals
  has_many :positions
end
