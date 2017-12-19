class BoPrizesController < ApplicationController

  def create
    @prize = Prize.new(prize_params)
    @prize.save
    redirect_back(fallback_location: "pages/challenges")
  end

  def destroy
    @position_prize = Prize.find(params[:id])
    @position_prize.destroy
    redirect_back(fallback_location: "pages/challenges")
  end

  def prize_params
    params.require(:prize).permit(:position, :challenge_id, :prize_content_id)
  end


end
