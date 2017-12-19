class Api::RankingsController < BaseApiController


  def index
    @users = User.includes(:style, :challenge)
                 .merge(Style.filter(params.slice(:challenge_id)).references(:challenge))
                 .order('styles.count_of_wows DESC, styles.created_at ASC')
    render json: @users, include: {style: {only: %i[challenge_id count_of_wows created_at]}},
           except: %i[auth_id created_at updated_at]
  end

  def show
  end
end
