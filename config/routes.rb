Rails.application.routes.draw do
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
end

  # devise_for :customers
  # devise_for :admins
  #   get 'genres/index'
  #   get 'genres/create'
  #   get 'genres/edit'
  #   get 'genres/update'
  # end
  # namespace :admin do
  #   get 'orders/show'
  #   get 'orders/update'
  # end
  # namespace :admin do
  #   get 'customers/index'
  #   get 'customers/show'
  #   get 'customers/edit'
  #   get 'customers/update'
  # end
  # namespace :admin do
  #   get 'homes/top'
  # end
  # namespace :admin do
  #   get 'sessions/new'
  #   get 'sessions/create'
  #   get 'sessions/destroy'
  # end
  # namespace :public do
  #   get 'orders/new'
  #   get 'orders/confirm'
  #   get 'orders/completion'
  #   get 'orders/create'
  #   get 'orders/index'
  #   get 'orders/show'
  # end
  # namespace :public do
  #   get 'cart_items/index'
  #   get 'cart_items/update'
  #   get 'cart_items/destroy'
  #   get 'cart_items/destroy_all'
  #   get 'cart_items/create'
  # end
  # namespace :public do
  #   get 'customers/show'
  #   get 'customers/edit'
  #   get 'customers/update'
  #   get 'customers/cancellation'
  #   get 'customers/withdrawal'
  # end
  # namespace :public do
  #   get 'sessions/new'
  #   get 'sessions/create'
  #   get 'sessions/destroy'
  # end
  # namespace :public do
  #   get 'registrations/new'
  #   get 'registrations/create'
  # end
  # namespace :public do
  #   get 'items/index'
  #   get 'items/show'
  # end
  # namespace :public do
  #   get 'homes/top'
  #   get 'homes/about'
  # end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
