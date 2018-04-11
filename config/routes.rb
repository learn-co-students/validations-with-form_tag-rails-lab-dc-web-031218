Rails.application.routes.draw do
  resources :authors, except: [:index, :destroy]
  resources :posts, except: [:index, :destroy]
end
