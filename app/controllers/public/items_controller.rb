class Public::ItemsController < ApplicationController
     before_action :authenticate_customer!
     
     def index
         @items=Item.where(is_active: ture).page(params[:page]).per(8)
         @quantity=Item.count
     end
     
     def show
         @item=Item.find(params[:id])
         @cart_item=CartItem.new
     end
     
     private
     
     def item_params
         params.require(:item).permit(:name, :price, :introduction, :image, :is_active)
     end
     
end
