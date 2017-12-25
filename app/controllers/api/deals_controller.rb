class Api::DealsController < BaseApiController

  def index
    @deals = Deal.paginate(page: params[:page], per_page: 15)

    render json: @deals, include: {partner: {only: %i[name]}},
           except: %i[created_at updated_at]
  end

end
