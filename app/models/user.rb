class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :recoverable,
  # :rememberable, :trackable, and :omniauthable
  devise :database_authenticatable, :registerable, :validatable

  has_many :propositions
  has_many :claims
  has_many :thumbs

  validates :name, presence: true

  default_scope -> {order(:name)}

end
