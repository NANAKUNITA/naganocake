Rails.application.routes.draw do
root 'public/homes#top'

# customerのルーティング
  devise_for :customers, skip:[:passwords], controllers:{
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  devise_for :admin, skip:[:registrations, :passwords], controllers:{
    sessions: "admin/sessions"
  }

  namespace :admin do
    get '/admin' => 'admin#top'
    resources :items
    resources :genres
    resources :customers
    resources :orders, only:[:index, :show, :update]
    resources :order_items, only:[:update]
  end

  namespace :public do
    get '/about' => 'homes#about'
    delete '/cart_items/destroy_all' => 'cart_items#destroy_all'
    resources :items, only:[:index, :show, :new]do
      get :search, on: :collection
    end
    resources :cart_items
    post '/orders' => 'orders#create'
    get '/'
    post '/orders/confirm' => 'orders#confirm'
    get '/orders/complete' => 'orders#complete'

  devise_for :admin, skip:[:registrations, :passwords], controllers:{
    sessions: "admin/sessions"
  }
 end
end
