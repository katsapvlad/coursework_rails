class OrdersController < ApplicationController
  def index
    @orders = Order.all
  end

  def new
    redirect_to root_path unless session[:admin_id]
  end

  def create
    order = Order.new(order_params)
    if order.save
      user = User.find_by_id(order.user_id)
      favour = Favour.find_by_id(order.favour_id)
      AdminNotifierMailer.send_email_about_order(favour, user).deliver
      redirect_to "/success_order"
    else
      redirect_to root_path
    end
  end

  private

  def order_params
    params.permit(:user_id, :favour_id)
  end
end