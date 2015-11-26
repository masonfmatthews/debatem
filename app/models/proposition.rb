class Proposition < ActiveRecord::Base
  belongs_to :user
  has_many :claims do
    def direct
      where(parent_id: nil)
    end
  end

  validates :user, presence: true
  validates :title, presence: true

  delegate :name, to: :user, prefix: "user"

  default_scope -> {order(created_at: :desc)}

  def percentage_agreement
    50.0
    # if positions.count > 0
    #   100.0 * positions.where(agree_with_proposition: true).count / positions.count
    # else
    #   0
    # end
  end
end
