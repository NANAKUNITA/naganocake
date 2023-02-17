Rails.application.routes.draw do
 #root 'public/homes#top'が最初の行に来ていたことにより、Invalid route name, already in use: 'new_user_session'  (ArgumentError)You may have defined two routes with the same name using the `:as` option, or you may be overriding a route already defined by a resource with the same naming. For the latter, you can restrict the routes created with `resources` as explained here: https://guides.rubyonrails.org/routing.html#restricting-the-routes-createdのエラーが出た。2箇所も同じことを定義していないのに、と思ったら、一番上にしてた。この行を削除することにより、解決。
  devise_for :customers, skip:[:passwords], controllers:{
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }
  
  devise_for :admin, skip:[:registrations, :passwords], controllers:{
    sessions: "admin/sessions"
  }
  
  #customer側
  scope module: :public do
    root 'homes#top'
    get '/about' => 'homes#about'
    resources :items, only:[:index, :show]
    patch '/customers/withdraw' => 'customers#withdraw'
    get '/customers/confirm_withdraw' => 'customers#confirm'
    resources :customers, only:[:show, :edit, :update]
    delete '/cart_items/destroy_all' => 'cart_items#destroy_all' 
    delete '/cart_items/:id' => 'cart_items#destroy_item'
    resources :cart_items, only:[:index, :update, :create]
    post '/orders/confirm' => 'orders#confirm'
    get '/orders/complete' => 'orders#complete'
    resources :orders, only:[:new, :create, :index, :show]
    resources :addresses, only:[:index, :edit, :create, :update, :destroy]
  end
  
  #admin側
  namespace :admin do
     root 'homes#top'
     resources :items, only:[:show, :index, :new, :create, :edit, :update]
     resources :genres, only:[:index, :create, :edit, :update]
     resources :customers, only:[:index, :edit, :update, :show]
    #resourcesは７つのアクションが全てデフォルトでついている。onlyをつけることによって、今回使うアクションのみが指定できる。
     patch '/admin/order_details/:id' => 'admin/orders_details#update'
     resources :orders, only:[:show, :update] 
     resources :order_details, only:[:update]
  end

end
