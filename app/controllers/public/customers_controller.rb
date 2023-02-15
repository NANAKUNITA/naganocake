class Public::CustomersController < ApplicationController
     before_action :authenticate_customer!
     def show
         @customer=current_customer
     end
     
     def edit
         @customer=Customer.find(params[:id])
     end
     
     def update
         @customer=Customer.find(params[:id])
         if @customer.update(customer_params)
             flash[:success]="You have edited user data successfully."
             redirect_to customer_path(@customer)
         else
             render 'edit'
         end
     end
     
     def confirm
         @customer=current_user
     end
     
     def withdraw
         @customer=Customer.find(params[:id])
         if @customer.update(is_deleted: true)
             sign_out current_customer
         end
         redirect_to root_path
     end
     
     private
     def customer_params
         params.require(:customer).permit(:is_deleted, :last_name, :first_name, :last_name_kana, :first_name_kana, :telephone_number, :email, :password, :postal_code, :address)
     end
     
end
