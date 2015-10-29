class Position < ActiveRecord::Base
  belongs_to :user
  belongs_to :proposal
  belongs_to :parent, class_name: "Position"
  has_many :responses, class_name: "Position", foreign_key: "parent_id"

  validates :user, presence: true
  validates :proposal, presence: true
  validates :title, presence: true
  validates :body, presence: true

  delegate :name, to: :user, prefix: "user"

  before_save :set_proposal_agreement

  def agreements
    responses.where(agree: true)
  end

  def disagreements
    responses.where(agree: false)
  end

  private def set_proposal_agreement
    if parent
      self.agree_with_proposal = (agree == parent.agree_with_proposal)
    else
      self.agree_with_proposal = agree
    end
    true
  end

end
