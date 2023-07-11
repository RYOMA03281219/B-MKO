Rails.application.routes.draw do
  # namespace :public do
  #   get 'password_resets/new'
  #   get 'password_resets/edit'
  # end
# 管理者用
# URL /admin/sign_in ...
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }

  namespace :admin do
    get '' => 'homes#top'
    patch "withdrawal/:id" => "customers#withdrawal", as: "withdrawal"
    resources :customers, only: [:index, :show, :edit, :update]
    resources :genres, only: [:index, :create, :update, :destroy]
    resources :items, only: [:index, :show, :edit, :update]
    get 'items/index'
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
    get '/customers/my_page' => 'customers#show'
    get '/customers/information/edit' => 'customers#edit'
    patch '/customers/information' => 'customers#update'
    get '/customers/cancellation' => 'customers#cancellation'
    patch '/customers/withdrawal' => 'customers#withdrawal'
    resources :items, only:[:index, :new, :create, :show, :edit, :update, :destroy]
    resources :password_resets, only: [:new, :create, :edit, :update]
    resources :post_images, only: [:new, :create, :index, :show, :destroy] do
      resource :favorites, only: [:create, :destroy]
      resources :post_comments, only: [:create, :destroy]
    end
  end
end
