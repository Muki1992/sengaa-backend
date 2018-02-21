class Api::StylesController < BaseApiController

  api :GET, '/challenges/:challenge_id/styles', 'Get random styles of a challenge'
  api :GET, '/styles', 'Get styles from all challenge (Filtering optional)'
  param :with_award, Integer, required: false
  param :category_id, Integer, required: false
  param :gender, Integer, required: false
  param :state, Integer, required: false
  param :page, Integer, required: false
  def index
    if params[:with_award] == '1'
      @styles = Style.includes(:challenge).joins(:award)
                    .merge(Challenge.filter(params.slice(:challenge_id, :category_id, :gender, :state)).references(:challenge))
                    .paginate(page: params[:page], per_page: 15)
    else
      @styles = Style.includes(:challenge).filter(params.slice(:id, :challenge_id, :user_id))
                    .merge(Challenge.filter(params.slice(:id, :category_id, :gender, :state)).references(:challenge))
                    .limit(9)
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
