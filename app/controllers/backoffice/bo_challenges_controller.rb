class Backoffice::BoChallengesController < ApplicationController

  def create
    @challenge = Challenge.new(challenge_params)
    @challenge.save
    redirect_back(fallback_location: "pages/challenges")
  end

  def destroy
    @challenge = Challenge.find(params[:id])
    @challenge.destroy
    redirect_back(fallback_location: "pages/challenges")
  end

  def add_challenge
    challenge = Challenge.find(params[:prize_add_form][:challenge_id])
    prize = PrizeContent.find(params[:prize_add_form][:prize_id])
    challenge.prizes << prize
    redirect_back(fallback_location: "pages/challenges")
  end

  def challenge_params
    params.require(:challenge).permit(:title, :description, :category_id, :start, :end, :gender, prize_ids: [])
  end


end
