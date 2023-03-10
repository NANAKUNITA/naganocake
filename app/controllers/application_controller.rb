class ApplicationController < ActionController::Base
   #これを入れると、全てにログイン画面が適用されてしまう。
   #before_action :authenticate_customer!,except: [:top, :about]
   before_action :configure_permitted_parameters, if: :devise_controller?

   def after_sign_in_path_for(resource)
      case resource
      when Customer
         items_path(current_customer.id)
      when Admin
         root_path
      end
   end

   def after_sign_out_path_for(resource)
     root_path
   end

   add_flash_types :success, :info, :warning, :danger


  private

   def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up,keys:[:last_name, :first_name, :last_name_kana, :first_name_kana, :email, :postal_code, :address, :telephone_number, :password])
   end
end
