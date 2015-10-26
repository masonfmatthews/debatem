class Proposal < ActiveRecord::Base
  belongs_to :user
  has_many :positions

  validates :user, presence: true
  validates :title, presence: true

  delegate :name, to: :user, prefix: "user"

  def percentage_agreement
    100.0 * positions.where(agree_with_proposal: true).count / positions.count
  end
end
