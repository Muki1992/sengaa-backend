class PartnersController < ApplicationController

  def index
    load_partners
  end

  def show
    load_partner
  end

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

  private

  def load_partners
    @partners = Partner.all.paginate(page: params[:partners_page], per_page: 5)

    scope = Partner.all
    scope = paginate(scope)
    @partners = scope
  end

  def paginate(scope)
    scope.paginate(page: page_param)
  end

  def page_param
    params[:page]
  end

  def partner_params
    params.require(:partner).permit(:name, :url, :image)
  end
end
