Rails.application.routes.draw do
  devise_for :users

  # devise_for :users, only: [:session], controller: {session: 'api/v1/sessions'}

  namespace :api do
    namespace :v1 do
      resources :mesas
      resources :produtos
      resources :pedidos
      resources :itens
    end
  end
end
