Rails.application.routes.draw do
  get 'profiles/show'
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "homepages#index"
  resources :discussions do
    resources :posts, only: [:create]
  end

  get 'profile', to: 'profiles#show'
end
