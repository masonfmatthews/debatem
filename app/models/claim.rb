class Claim < ActiveRecord::Base
  belongs_to :user
  belongs_to :proposition

  belongs_to :parent, class_name: "Claim"
  has_many :children, class_name: "Claim", foreign_key: :parent_id

  has_many :thumbs do
    def up
      where(up: true)
    end
    def down
      where(up: false)
    end
  end

  delegate :name, to: :user, prefix: "user"

  before_save :calculate_score_cache

  private def calculate_score_cache
    self.score_cache = base_score * thumb_factor
  end

  private def base_score
    positive ? 1.0 : -1.0
  end

  private def thumb_factor
    raw_factor = 1 - (thumbs.down.count - thumbs.up.count)*0.1
    [-1, [1, raw_factor].min].max
  end
end
