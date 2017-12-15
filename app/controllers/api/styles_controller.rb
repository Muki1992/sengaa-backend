class Api::StylesController < BaseApiController

  def index
    @styles = Style.all
    render json: @styles, except: %i[created_at updated_at]
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
