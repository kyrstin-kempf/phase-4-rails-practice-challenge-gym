Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :memberships, only:[:index, :create]
  resources :gyms, only:[:index, :show, :update, :destroy]
  resources :clients, only:[:index,:update, :show]
end
