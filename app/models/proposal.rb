class Proposal < ActiveRecord::Base
  belongs_to :user
  has_many :positions

  validates :user, presence: true
  validates :title, presence: true
end
