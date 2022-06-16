Rails.application.routes.draw do
  resources :clients, only: %i[show index update]
  resources :gyms, only: %i[destroy show]
  resources :memberships, only: %i[create]
end
