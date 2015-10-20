class Position < ActiveRecord::Base
  belongs_to :user
  belongs_to :proposal
  belongs_to :parent, class_name: "Position"
  has_many :responses, class_name: "Position", foreign_key: "parent_id"
end
