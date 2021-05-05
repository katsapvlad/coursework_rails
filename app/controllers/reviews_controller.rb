class ReviewsController < ApplicationController
  def index
    @reviews = Review.all
    if session[:user_id] != nil
      @user_id = User.find(session[:user_id]).id
    end
  end

  def create
    review = Review.new(review_params)
    if review.save
      redirect_to '/reviews'
    else
      flash.now[:notice] = review.errors.full_messages.to_s
    end
  end

  private

  def review_params
    params.permit(:text, :user_id, :rating)
  end
end
