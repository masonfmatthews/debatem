class PositionsController < ApplicationController
  def show
    @position = Position.find(params[:id])
  end

  def new
    @position = Position.new(parent_id: params[:parent_id],
        proposal_id: params[:proposal_id],
        agree: params[:agree])
  end

  def create
    @position = Position.new(position_params)
    if @position.save
      if @position.parent
        redirect_to proposal_position_path(@position.proposal, @position.parent), notice: "Your response has been saved."
      else
        redirect_to @position.proposal, notice: "Your response has been saved."
      end
    else
      render "new"
    end
  end

  private def position_params
    params.require(:position).permit(:user_id, :proposal_id, :parent_id, :title, :body, :agree)
  end
end
