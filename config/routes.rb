Rails.application.routes.draw do
  root to: 'imports#new'
  
  get 'users/index', as: :users
  resource :imports, only: [:new, :create]
end
