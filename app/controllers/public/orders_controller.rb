class Public::OrdersController < ApplicationController
     before_action :authenticate_customer!
     #before_action :request_post?, only: [:confirm]

     def index
        @orders=current_customer.orders
     end
     
     def show
         @order=Order.find(params[:id])#orderを特定
         @order_item=@order.order_items#特定したordersからorder_itemsを全て取得する
         @total=0 #変数定義。合計を計算する変数。
     end
     
     def new
         @customer=current_customer
         @i=current_customer.cart_items
         @all=Item.all
         @i.each do |item|
             @all=@all.where.not(id: item.item_id)
         end
         @item_random=@all.order("RANDOM()").limit(2)
         @order=Order.new
         @address=Address.new
     end
     
     def confirm
         params[:order][:payment_method]=params[:order][:payment_method].to_i#payment_methodの数値に変換
         @order=Order.new(order_params) #情報を渡している
         if params[:address_select] == "radio1"
             @order.postal_code=current_customer.postal_code
             @order.address=current_customer.address
             @order.name=current_customer.last_name+current_customer.first_name
             
        elsif params[:address_select] == "radio2"
                 @order.postal_code=Address.find(params[:address][:address]).postal_code
                 @order.address=Address.find(params[:address][:address]).address
                 @order.name=Address.find(params[:address][:address]).name
        elsif params[:address_select] == "radio3"
                 @address=Address.new
                 @address.address=params[:order][:address]
                 @address.name=params[:order][:name]
                 @address.postal_code=params[:order][:postal_code]
                 @address.customer_id=current_customer.id
            if @address.save
              @order.postal_code=@address.postal_code
              @order.name=@address.name
              @order.address=@address.address
            else
               render 'new'
            end
         end
         
         @cart_items =CartItem.where(customer_id: current_customer.id)
         @total=0
     end
     
     def complete
     end
     
     def create
         @order=Order.new(order_params)
         @order.customer_id=current_customer.id
         @order.save
         current_customer.cart_items.each do
             @order_item=OrderItem.new
             @order_item.item_id=cart_item.item_id
             @order_item.amount=cart_item.amount
             @order_item.save
         end
         current_customer.cart_items.destroy_all
         redirect_to orders_complete_path
     end
     
     private
     

    # def request_post?
         #redirect_to 
     #end
     
     def order_params
         params.require(:order).permit(:payment_method, :address, :shipping_cost, :postal_code, :name, :total_payment, :status)
     end
     
     def address_params
         params.permit(:address, :name, :postal_code, :customer_id)
     end

end
