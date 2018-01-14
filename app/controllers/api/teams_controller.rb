class Api::TeamsController < BaseApiController

  def index
    @teams = Team.filter(params.slice(:name)).paginate(page: params[:page], per_page: 10)
    render json: @teams, except: %i[created_at updated_at]
  end

  def show
    @team = Team.find(params[:id])
    render json: @team, include: {membership: {only: %i[level]}}, except: %i[created_at updated_at]
  end

  def create
    @team = Team.new(team_params)
    @team.user = @current_user
    if @team.save
      render json: @team, status: 200
    end
  end

  def destroy
    team = Team.find(params[:id])
    if team.user_id == @current_user.id
      render json: {}, status: 200 if team.destroy
    else
      render json: {errors: ['Not your team']}, status: 400
    end

  end

  def team_params
    params.require(:team).permit(:name, :description, :homepage, :public)
  end
end
