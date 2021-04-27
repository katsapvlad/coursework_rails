class NewsCommentsController < ApplicationController
  def create
    news_comment = NewsComment.new(news_comment_params)
    flash.now[:notice] = if news_comment.save
                           'Success!'
                         else
                           news_comment.errors.full_messages.to_s
                         end
  end

  private

  def news_comment_params
    params.permit(:text, :user_id, :news_id)
  end
end
