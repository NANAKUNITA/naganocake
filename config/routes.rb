Rails.application.routes.draw do
  
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
