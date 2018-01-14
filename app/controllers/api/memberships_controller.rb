class Api::MembershipsController < BaseApiController
  def index
    @memberships = Membership.filter(params.slice(:team_id, :user_id, :role))
                       .paginate(page: params[:page], per_page: 15)

    render json: @memberships, include: {team: {except: %i[created_at updated_at]}},
           except: %i[created_at updated_at]
  end


  def destroy
    membership = Membership.find(params[:id])
    if membership.user_id == @current_user.id
      if membership.role != 'owner'
        render json: {}, status: 200 if membership.destroy
      else
        render json: {errors: ['You cannot leave your own Team']}, status: 400
      end
    else
      render json: {errors: ['Not your membership']}, status: 400
    end

  end

  def membership_params
    params.require(:membership).permit(:team_id)
  end


end
