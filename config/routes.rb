Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/statistics', as: 'rails_admin'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  post 'addresses', to: 'address#info'
  get 'random', to: 'address#random'
end
