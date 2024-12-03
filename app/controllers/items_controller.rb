class ItemsController < ApplicationController
  def index
    @items = Item.all
    render :index
  end

  def show
    @item = Item.find_by(id: params[:id])
    render :show
  end

  def create
    @item = Item.create(
      name: params[:name],
      category: params[:category],
      price: params[:price],
      perishable: params[:perishable],
      stock: params[:stock],
    )
    render :show
  end

  def update
    @item = Item.find_by(id: params[:id])
    @item.update(
      name: params[:name] || @item.name,
      category: params[:category] || @item.category,
      price: params[:price] || @item.price,
      perishable: params[:perishable] || @item.perishable,
      stock: params[:stock] || @item.stock,
    )
    render :show
  end

  def destroy
    @item = Item.find_by(id: params[:id])
    @item.destroy
    render json: { message: "item removed successfully." }
  end
end
