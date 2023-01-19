Rails.application.routes.draw do
 #root 'public/homes#top'が最初の行に来ていたことにより、Invalid route name, already in use: 'new_user_session'  (ArgumentError)You may have defined two routes with the same name using the `:as` option, or you may be overriding a route already defined by a resource with the same naming. For the latter, you can restrict the routes created with `resources` as explained here: https://guides.rubyonrails.org/routing.html#restricting-the-routes-createdのエラーが出た。2箇所も同じことを定義していないのに、と思ったら、一番上にしてた。この行を削除することにより、解決。
  devise_for :customers, skip:[:passwords], controllers:{
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  devise_for :admin, skip:[:registrations, :passwords], controllers:{
    sessions: "admin/sessions"
  }
  #admin
  namespace :admin do
    get '/admins' => 'admins#top'
    resources :items
    resources :genres
    resources :members
    resources :orders,only:[:index,:show,:update]
    resources :order_items, only:[:update]
  end
  #customer
    root 'homes#top'
    get '/about' => 'homes#about' #aboutページ
    post '/orders/confirm' => 'orders#confirm', as: 'confirm' #注文情報確認画面への遷移
    get '/orders/complete' => 'orders#complete' #注文完了画面
    get '/orders/new' => 'orders#new' #注文情報入力画面（支払方法・配送先の選択）
    delete '/cart_items/destroy_all' => 'destroy_all' #カート内商品データ削除（全て）
    resources :customers, only: [:show, :edit, :update]
    get '/customers/confirm_withdraw' => 'customers#confirm_withdraw', as: 'confirm_withdraw' #顧客の退会確認画面
    patch '/customers/withdraw' => 'customers#withdraw', as: 'withdraw' #顧客の退会処理（ステータスの更新）
    resources :addresses, except: [:new, :show] #exceptは指定したくないアクションを適用するときに使う
    resources :cart_items, except: [:new, :show, :edit]
    resources :items, only: [:index, :show]
    resources :genres, only: [:index] do
    resources :items, only: [:index]
  end
    resources :orders, except: [:edit, :update, :destroy]
end
