Rails.application.routes.draw do

# customerのルーティング
  devise_for :customers, skip:[:passwords], controllers:{
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  scope module: 'customers' do
    root 'items#top'
    resources :items, only:[:show, :index]
    get 'about' => 'items#about'
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
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :admin do
    root 'toppages#index'
  end
  # これでURLは/adminになる。
  # rails g  controller admin/toppages indexを実行。
  # 同じくrails g controllerで、admin/application_controller.rbを作成。
  # admin/application_controller.rbに移動。
end
