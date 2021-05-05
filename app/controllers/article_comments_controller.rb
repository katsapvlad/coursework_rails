class ArticleCommentsController < ApplicationController

  def create
    article_comment = ArticleComment.new(article_comment_params)
    flash.now[:notice] = if article_comment.save
                           redirect_to "/articles/#{Article.find(article_comment.article_id).id}"
                         else
                           article_comment.errors.full_messages.to_s
                         end
  end

  private

  def article_comment_params
    params.permit(:text, :user_id, :article_id)
  end
end
