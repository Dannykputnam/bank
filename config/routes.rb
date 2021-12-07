Rails.application.routes.draw do
  root 'accounts#index'

  devise_for :users

  resources :accounts do 
      resources :items
  end


  # Parent child example
  # resources :items do
  #   resources :comments
  # end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
