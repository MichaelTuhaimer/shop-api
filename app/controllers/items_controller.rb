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
      description: params[:description],
      perishable: params[:perishable],
      stock: params[:stock],
    )
    if @item.valid?
      render :show, status: 200
    else
      render json: { errors: @item.errors.full_messages }, status: 422
    end
  end

  def update
    @item = Item.find_by(id: params[:id])
    @item.update(
      name: params[:name] || @item.name,
      category: params[:category] || @item.category,
      price: params[:price] || @item.price,
      description: params[:description] || @item.description,
      perishable: params[:perishable] || @item.perishable,
      stock: params[:stock] || @item.stock,
    )
    if @item.valid?
      render :show, status: 200
    else
      render json: { errors: @item.errors.full_messages }, status: 422
    end
  end

  def destroy
    @item = Item.find_by(id: params[:id])
    @item.destroy
    render json: { message: "item removed successfully." }
  end
end
