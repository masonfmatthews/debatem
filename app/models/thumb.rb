class Thumb < ActiveRecord::Base
  belongs_to :user
  belongs_to :claim

  validates :user, presence: true
  validates :claim, presence: true
end
