class Api::CommentsController < BaseApiController

  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      render json: @comment
    end
  end

  def comment_params
    params.require(:comment).permit(:user_id, :style_id, :content)
  end
end
