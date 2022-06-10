Rails.application.routes.draw do
  resources :sessions, only: %i(new create destroy)
  resources :users, only: %i(new create destroy)
  resources :pictures do
    collection do
      post :confirm
    end
  end
end
