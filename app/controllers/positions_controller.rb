class PositionsController < ApplicationController
  def show
    @position = Position.find(params[:id])
  end

  def new
    @position = Position.new
  end

  def create
    @position = Position.new(position_params)
    if @position.save
      redirect_to proposal_position_path(@position.proposal, @position), notice: "Position saved."
    else
      render "new"
    end
  end

  private def position_params
    params.require(:position).permit(:user_id, :proposal_id, :parent_id, :title, :body)
  end
end
