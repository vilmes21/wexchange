Rails.application.routes.draw do
  resources :posts do
    resources :likes, only: [:create, :destroy], shallow: true
    resources :requests, only: [:create, :index, :destroy]
    resources :comments, only: [:create, :edit, :update, :destroy]
    resources :watches, only: [:create, :index, :destroy], shallow: true
  end

  resources :users, only: [:new, :create, :show, :edit]  do
    resources :reviews, only: [:create, :destroy]
    resources :wishes, only: [:create, :edit, :update, :destroy]
  end

  resources :sessions, only: [:new, :create] do
    delete :destroy, on: :collection
  end

  root "homes#home"
  get '/about'=> 'homes#about', as: :about
  get '/faq'=> 'homes#faq', as: :faq
  get '/messages' => 'homes#messages', as: :messages
  get '/watches' => 'homes#watches', as: :watches
  get '/requests/:id' => 'requests#show', as: :request
  get '/user_requests' => 'homes#user_requests', as: :user_requests
end
