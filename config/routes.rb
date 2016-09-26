Rails.application.routes.draw do
  resources :posts do
    resources :likes, only: [:create, :destroy]
    resources :requests, only: [:create, :destroy]
    resources :comments, only: [:create, :edit, :update, :destroy]
    resources :watches, only: [:create, :destroy]
  end

  resources :users, only: [:new, :create]  do
    resources :reviews, only: [:create, :destroy]
    resources :wishes, only: [:create, :edit, :update, :destroy]
  end

  resources :sessions, only: [:new, :create] do
    delete :destroy, on: :collection
  end

  root "homes#home"
  get '/about'=> 'homes#about', as: :about
  get '/faq'=> 'homes#faq', as: :faq
end
