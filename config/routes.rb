Rails.application.routes.draw do
root 'public/homes#top'

# customerのルーティング
  devise_for :customers, skip:[:passwords], controllers:{
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }
  namespace :admin do
    get '/admin' => 'admin#top'
    resources :items
    resources :genres
    resources :members
    resources :orders, only:[:index, :show, :update]
    resources :order_items, only:[:update]
  end

  namespace :customer do
    resources :genres, only:[:show]
    patch 'customers/withdraw' => 'customers#withdraw', as: 'customers_withdraw'
    get 'show' => 'customers#show'
    get 'customers/edit' => 'customers#edit'
    patch 'update' => 'customers#update'
    get 'confirm' => 'customers#'
  devise_for :admin, skip:[:registrations, :passwords], controllers:{
    sessions: "admin/sessions"
  }
end
