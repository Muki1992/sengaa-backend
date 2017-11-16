class PartnersController < ApplicationController

  def create
    @partner = Partner.new(partner_params)
    @partner.save
    redirect_back(fallback_location: "pages/partners")
  end

  def destroy
    @partner = Partner.find(params[:id])
    @partner.destroy
    redirect_back(fallback_location: "pages/partners")
  end

  def partner_params
    params.require(:partner).permit(:name, :url, :image)
  end
end
