class Admin::OrdersController < ApplicationController
        before_action :authenticate_admin!
        
        def show
            @order=Order.find(params[:id]) #注文内容の情報の取得
            @order_details=@order.order_details #注文内容の商品を取得
        end
        
        def update
            @order=Order.find(params[:id]) #注文詳細の特定
            @order_details=@order.order_details #注文から紐ずく商品の取得
            @order.update(order_params) #注文ステータスの更新
            if @order.status == "入金確認" #注文ステータスが入金確認であれば以下のことを実行
            @order_details.update_all(making_status: 1) #製作ステータスを「製作待ち」へ更新
            end
            redirect_to admin_order_path(@order) #注文履歴詳細へ
        end
        
        private
        def order_params
            params.require(:order).permit(:status)
        end
    
end
