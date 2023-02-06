Rails.application.routes.draw do
 #root 'public/homes#top'が最初の行に来ていたことにより、Invalid route name, already in use: 'new_user_session'  (ArgumentError)You may have defined two routes with the same name using the `:as` option, or you may be overriding a route already defined by a resource with the same naming. For the latter, you can restrict the routes created with `resources` as explained here: https://guides.rubyonrails.org/routing.html#restricting-the-routes-createdのエラーが出た。2箇所も同じことを定義していないのに、と思ったら、一番上にしてた。この行を削除することにより、解決。
  devise_for :customers, skip:[:passwords], controllers:{
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }
  
  scope module: 'customers' do
    root 'homes#top' #topページ
    resources :items, only: [:show, :index]
    get 'about' => 'homes#about' #aboutページ
  end

  #customer側
  namespace :customers do
    resources :genres, only: [:show]
    patch '/customers/withdraw' => 'customers#withdraw', as: 'customers_withdraw' #顧客の退会処理（ステータスの更新）
    get 'show' => 'customers#show'
    get 'customers/edit' => 'customers#edit'
    patch 'update' => 'customers#update'
    get 'confirm' => 'customers#confirm'
    post '/orders/confirm' => 'orders#confirm', as: 'confirm' #注文情報確認画面への遷移
    get '/orders/complete' => 'orders#complete' #注文完了画面
    get '/orders/new' => 'orders#new' #注文情報入力画面（支払方法・配送先の選択）
    resources :orders, only: [:create, :new, :index, :show]
    #destroy_allとdestroy_itemはdestroyで統一してもいいのか
    resources :cart_items, only: [:index, :create, :update, :destroy_all, :destroy_item]
　　delete 'cart_items' => 'cart_items#destroy_all', as: 'destroy_all' #カート内商品データ削除（全て）
    resources :customers, only: [:show, :edit, :update]
    get '/customers/confirm_withdraw' => 'customers#confirm_withdraw', as: 'confirm_withdraw' #顧客の退会確認画面
    resources :addresses, only: [:index, :create, :destroy, :edit] #exceptは指定したくないアクションを適用するときに使う
  end
  
  #admin側
    devise_for :admin, skip:[:registrations, :passwords], controllers:{
    sessions: "admin/sessions"
  }
  
  namespace :admin do
    get '/admins' => 'admins#top'
    resources :items, only:[:show, :index, :new, :create, :edit, :update]
    resources :genres, only:[:index, :create, :edit, :update]
    resources :customers, only:[:index, :edit, :update, :show]
    #resourcesは７つのアクションが全てデフォルトでついている。onlyをつけることによって、今回使うアクションのみが指定できる。
    resources :orders, only:[:show,:update] 
    resources :order_details, only:[:update]
  end

end
