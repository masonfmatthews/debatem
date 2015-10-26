class Proposal < ActiveRecord::Base
  belongs_to :user
  has_many :positions do
    def direct
      where(parent_id: nil)
    end
  end

  validates :user, presence: true
  validates :title, presence: true

  delegate :name, to: :user, prefix: "user"

  def percentage_agreement
    if positions.count > 0
      100.0 * positions.where(agree_with_proposal: true).count / positions.count
    else
      0
    end
  end
end
