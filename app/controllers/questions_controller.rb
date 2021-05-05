class QuestionsController < ApplicationController
  def index
    @questions = Faq.all
  end

  def new
    redirect_to root_path unless session[:admin_id]
  end


  def create
    question = Faq.new(faq_params)
    if question.save
      redirect_to '/questions/'
    else
      flash.now[:notice] = question.errors.full_messages.to_s
      render action: 'new'
    end
  end

  private

  def faq_params
    params.permit(:question, :answer)
  end
end
