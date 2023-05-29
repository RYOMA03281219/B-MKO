Rails.application.routes.draw do
  namespace :public do
    get 'addresses/index'
    get 'addresses/edit'
    get 'addresses/create'
    get 'addresses/update'
    get 'addresses/destroy'
  end
# 管理者用
# URL /admin/sign_in ...
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }

  namespace :admin do
    get '' => 'homes#top'
    resources :customers, only: [:index, :show, :edit, :update]
    resources :orders, only: [:show, :update]
    resources :genres, only: [:index, :create, :edit, :update]
  end

    # 顧客用
  # URL /customers/sign_in ...
  devise_for :customers,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  scope module: :public do
    root 'homes#top'
    get '/homes/about' => 'homes#about'
    get '/customers/cancellation' => 'customers#cancellation'
    patch '/customers/withdrawal' => 'customers#withdrawal'
    resources :customer, only:[:show, :edit, :update]
    delete '/cart_items/destroy_all' => 'cart_items#destroy_all'
    resources :cart_items, only:[:index, :update, :destroy, :create]
    resources :items, only:[:index, :new, :create, :show, :edit, :update]
    post '/orders/confirm' => 'orders#confirm'
    get '/orders/completion' => 'orders#completion'
    resources :orders, only:[:new, :create, :index, :show]
    resources :addresses, only:[:index, :edit, :create, :update, :destroy]
  end
end
