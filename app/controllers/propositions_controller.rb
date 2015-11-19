class PropositionsController < ApplicationController
  def index
    @propositions = Proposition.all
  end

  def show
    @proposition = Proposition.find(params[:id])
  end

  def new
    @proposition = Proposition.new
  end

  def create
    @proposition = Proposition.new(proposition_params)
    if @proposition.save
      redirect_to propositions_path, notice: "Your proposition has been saved."
    else
      render "new"
    end
  end

  private def proposition_params
    params.require(:proposition).permit(:user_id, :title, :body)
  end
end
