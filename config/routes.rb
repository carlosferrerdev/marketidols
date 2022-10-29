Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  resources :idols, only: %i[index new create show destroy] 
    # resources :orders, only: %i[new create]
  # end
  # resources :orders, only: :destroy
end
