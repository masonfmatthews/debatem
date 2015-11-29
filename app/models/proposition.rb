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

  def thumb_count
    bools = {true: 1, false: -1}
    claims.joins(:thumbs)
        .select("claims.positive AS positive, thumbs.up AS up")
        .reduce(0) {|sum, c| sum + (c.positive ? 1 : -1)*(c.up ? 1 : -1) }
  end

  def percentage_agreement
    if claims.count > 0
      score = thumb_count + 100.0 * claims.where(positive: true).count / claims.count
      [100, [0, score].max].min
    else
      0
    end
  end
end
