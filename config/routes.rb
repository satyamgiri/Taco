Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :tacos, only: [:index, :create, :destroy], constraints: { format: 'json' }
end
