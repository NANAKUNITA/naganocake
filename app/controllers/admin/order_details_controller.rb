class Admin::OrderDetailsController < ApplicationController
    before_action :authenticate_admin!
    
    def update
        @order_detail=Order_detail.find(params[:id]) #特定する
        @order= @order_detail.order #注文商品から注文テーブルの呼び出し（処理を増やさないため）
        @order_detail.update(order_detail_params) #製作ステータスの更新
        
        if @order_detail.making_status == "製作中" #製作ステータスが「製作中」
        @order.update(status: 2) #注文ステータスを「製作中」に更新
        
        elsif @order.order_details.count == @order.order_details.where(making_status: "製作完了").count
            @order.update(status: 3) #注文ステータスを「発送準備中」に更新
        end
        redirect_to admin_order_path(@order_detail.order) #注文履歴詳細へ
    end
    
    private
    def order_detail_params
        params.require(:order_detail).permit(:making_status)
    end
end
