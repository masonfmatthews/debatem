class ProposalsController < ApplicationController
  def index
    @proposals = Proposal.order(created_at: :desc)
  end

  def show
    @proposal = Proposal.find(params[:id])
  end

  def new
    @proposal = Proposal.new
  end

  def create
    @proposal = Proposal.new(proposal_params)
    if @proposal.save
      redirect_to proposals_path, notice: "Proposal saved."
    else
      render "new"
    end
  end

  private def proposal_params
    params.require(:proposal).permit(:user_id, :title, :body)
  end
end
