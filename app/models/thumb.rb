class Thumb < ActiveRecord::Base
  belongs_to :user
  belongs_to :claim

  validates :user, presence: true
  validates :claim, presence: true

  after_save :update_claim

  private def update_claim
    claim.save!
  end
end
