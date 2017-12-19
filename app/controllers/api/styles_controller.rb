class Api::StylesController < BaseApiController

  # 1: List of all styles that have won an award
  # 2: Randomizer for styles in active challenges
  def index
    if params[:with_award] == '1'
      @styles = Style.includes(:challenge).joins(:award)
                    .merge(Challenge.filter(params.slice(:challenge_id, :category_id, :gender, :state)).references(:challenge))
                    .paginate(page: params[:page], per_page: 15)
    else
      @styles = Style.includes(:challenge).filter(params.slice(:id, :challenge_id, :user_id))
                    .merge(Challenge.filter(params.slice(:id, :category_id, :gender, :state)).references(:challenge))
                    .limit(2)
                    .order('RANDOM()')
    end

    render json: @styles, include: {award: {only: %i[level]}, challenge: {only: %i[state]}},
           except: %i[created_at updated_at]
  end

  def show
    @style = Style.find(params[:id])
    render json: @style, include: {user: {except: %i[created_at updated_at]},
                                   comments: {only: :content,
                                              include: {user: {except: %i[created_at updated_at]}}},
                                   wowing_users: {only: :username}},
           except: %i[created_at updated_at]
  end
end
