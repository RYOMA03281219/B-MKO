Rails.application.routes.draw do
  namespace :public do
    get 'password_resets/new'
    get 'password_resets/edit'
  end
# 管理者用
# URL /admin/sign_in ...
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }

  namespace :admin do
    get '' => 'homes#top'
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
    get '/customers/cancellation' => 'customers#cancellation'
    patch '/customers/withdrawal' => 'customers#withdrawal'
    resources :customer, only:[:show, :edit, :update]
    resources :items, only:[:index, :new, :create, :show, :edit, :update]
    resources :password_resets, only: [:new, :create, :edit, :update]
  end
end
