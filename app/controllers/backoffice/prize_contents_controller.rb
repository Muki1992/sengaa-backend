class Backoffice::PrizeContentsController < ApplicationController

  def create
    @prize = PrizeContent.new(prizes_params)
    @prize.save
    redirect_back(fallback_location: "pages/prizes")
  end

  def destroy
    @prize = PrizeContent.find(params[:id])
    @prize.destroy
    redirect_back(fallback_location: "pages/prizes")
  end

  def prizes_params
    params.require(:prize).permit(:title, :description, :code, :partner_id)
  end
end
