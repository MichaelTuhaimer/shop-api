class OrdersController < ApplicationController
  def index
    @orders = current_user.orders
    render :index
  end

  def show
    @order = current_user.orders.find_by(id: params[:id])
    render :show
  end

  def create
    item = Item.find_by(id: params[:item_id])
    calc_subtotal = item.price * params[:quantity].to_i
    calc_tax = calc_subtotal * 0.09
    calc_total = calc_tax + calc_subtotal

    @order = Order.create(
      user_id: current_user.id,
      item_id: params[:item_id],
      quantity: params[:quantity],
      subtotal: calc_subtotal,
      tax: calc_tax,
      total: calc_total,
    )

    render :show
  end
end
