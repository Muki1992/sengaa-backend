class Api::TeamRequestsController < BaseApiController
  include Concerns::TeamSecured
  before_action :check_team_id_header, except: [:create, :update, :index]

  def index
    @team_requests = TeamRequest.filter(params.slice(:id, :team_id)).where(status: 'sent')
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

end
