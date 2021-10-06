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
  resources :messages, :only => [:create]
  resources :rooms, :only => [:create, :show, :index]
  resources :calendars
end