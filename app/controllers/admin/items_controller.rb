class Admin::ItemsController < ApplicationController
  before_action :authenticate_admin!
  def index
    @items=Item.page(params[:page]).per(10)
  end

  def new
    @item=Item.new
  end

  def create
    @item=Item.new(item_params)
    if @item.save
      redirect_to admin_item_path(@item.id)#ここはいらない？
    else
      redirect_to new_admin_item_path
    end
  end

  def show
    @item=Item.find(params[:id])
  end

  def edit
    @item=Item.find(params[:id])
  end

  def update
    @item=Item.find(params[:id])
    if @item.update(item_params)
      redirect_to admin_item_path(@item)
    else
      render "show"
    end
  end
  
  private
  
  def item_params
    params.require(:item).permit(:genre_id, :name, :price, :is_active, :introduction, :image)
  end
end
