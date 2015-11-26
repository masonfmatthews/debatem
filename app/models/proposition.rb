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
    if claims.count > 0
      100.0 * claims.where(positive: true).count / claims.count
    else
      0
    end
  end
end
