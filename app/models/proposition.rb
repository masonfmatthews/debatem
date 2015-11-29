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

    score = thumb_sum/thumb_count + 100.0 * claims.where(positive: true).count / claims.count
    [100, [0, score].max].min
  end


  private def all_thumbs
    @all_thumbs ||= claims.joins(:thumbs).select("claims.positive AS positive, thumbs.up AS up")
  end

  private def thumb_sum
    all_thumbs.reduce(0) {|sum, c| sum + (c.positive ? 1 : -1)*(c.up ? 1 : -1) }
  end

  private def thumb_count
    all_thumbs.length
  end
end
