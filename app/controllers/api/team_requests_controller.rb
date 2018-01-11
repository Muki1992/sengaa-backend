class Api::TeamRequestsController < BaseApiController
  before_action :check_team_id_header, only: [:index]

  def index
    @team_requests = TeamRequest.where(team_id: request.headers['team-id'], status: 'sent')
                         .paginate(page: params[:page], per_page: 15)

    render json: @team_requests, include: {user: {}},
           except: %i[created_at updated_at]
  end

  def update
    @team_request = TeamRequest.find params[:id]
    check_authorization_of_current_user(@team_request.team_id)
    @team_request.update(status: params[:status])
    render json: @team_request, status: 200
  end

  def create
    @team_request = TeamRequest.new(team_request_params)
    @team_request.user = @current_user
    render json: @team_request, status: 200 if @team_request.save
  end

  def team_request_params
    params.require(:team_request).permit(:team_id)
  end

  def check_team_id_header
    if request.headers['team-id'].present?
      check_authorization_of_current_user(request.headers['team-id'])
    else
      render json: {errors: ['Team id missing']}, status: 400
    end
  end

  private def check_authorization_of_current_user(team_id)
    membership = Membership.find_by_user_id_and_team_id(@current_user.id, team_id)
    unless membership.present? && (membership.role == 'Owner' || membership.role == 'Admin')
      render json: {errors: ['No admin rights']}, status: 400
    end
  end
end
