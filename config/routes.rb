Rails.application.routes.draw do
  devise_for :users
  root to: "animals#index"

  resources :animals do
    resources :comments
    collection do
      get 'search'
    end
  end
  resources :users
  resources :messages
  resources :rooms
  resources :calendars
end