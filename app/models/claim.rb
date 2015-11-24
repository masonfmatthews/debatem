class Claim < ActiveRecord::Base
  belongs_to :user
  belongs_to :proposition

  belongs_to :parent, class_name: "Claim"
  has_many :children, class_name: "Claim", foreign_key: :parent_id

  has_many :thumbs
end
