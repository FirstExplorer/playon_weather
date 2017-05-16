Rails.application.routes.draw do
  root 'weather#index'

  get :weather, to: 'weather#index'
  get :search_city, to: 'weather#search_city'
end
