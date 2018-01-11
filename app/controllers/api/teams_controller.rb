class Api::TeamsController < BaseApiController

  def index
    @teams = Team.filter(params.slice(:name)).paginate(page: params[:page], per_page: 10)
    render json: @teams, except: %i[created_at updated_at]
  end

  def show
    @team = Team.find(params[:id])
    render json: @team, except: %i[created_at updated_at]
  end

  def create
    @team = Team.new(team_params)
    @team.user = @current_user
    if @team.save
      render json: @team, status: 200
    end
  end

  def team_params
    params.require(:team).permit(:name, :description, :homepage, :public)
  end
end
