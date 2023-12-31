Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "homepages#index"

  resources :discussions do
    resources :posts, only: [:create]
  end

  resources :general_discussions

  resources :strategies

  resources :events do
    resources :event_threads, only: [:create]
  end

  resources :profiles, only: [:show, :edit, :update]

  devise_for :users, skip: [:sessions], controllers: { registrations: 'registrations' }
end
