Rails.application.routes.draw do
  root 'weather#search'

  resources :weather, only: [:index] do
    collection do
      get 'search'
      post 'details'
    end
  end

  get :locate_search, to: 'locate#search'
end
