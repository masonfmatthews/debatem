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
    return 0 if claims.blank?

    ((claims.reduce(0.0) {|sum, c| sum + c.score_cache} / claims.count) + 1) * 50
  end

end
