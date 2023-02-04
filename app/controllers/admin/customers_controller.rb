class Admin::CustomersController < ApplicationController
    before_action :authenticate_admin!
    
    #顧客一覧画面
    def index
        @customers=Customer.page(params[:page]).per(10)
    end
    
    #顧客編集画面
    def edit
        @customer=Customer.find(params[:id])
    end
    
    #顧客情報の更新--！変更する箇所あり！
    def update
        @customer=Customer.find(params[:id])
        if @customer.update(customer_params)
            redirect_to admin_customer_path(@customer)
        else
            render "edit"
        end
    end
    
    #顧客詳細画面
    def show
        @customer=Customer.find(params[:id])
    end
    
    private
    def customer_params
        params.require(:customer).permit(:email, :last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code,:address, :telephone_number, :is_deleted)
    end
end
