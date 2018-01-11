class Api::MembershipsController < BaseApiController
  def index
    @memberships = Membership.filter(params.slice(:team_id, :user_id, :role))
                       .paginate(page: params[:page], per_page: 15)

    render json: @memberships, include: {team: {except: %i[created_at updated_at]}},
           except: %i[created_at updated_at]
  end

  def membership_params
    params.require(:membership).permit(:team_id)
  end



end
