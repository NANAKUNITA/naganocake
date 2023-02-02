class Admin::OrdersController < ApplicationController
        before_action :authenticate_admin!
        
        def show
            @order=Order.find(params[:id]) #注文内容の情報の取得
            @order_items=@order.order_items #注文内容の商品を取得
        end
        
        def update
            
        end
    
end
