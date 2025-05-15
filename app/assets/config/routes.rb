Rails.application.routes.draw do
  resources :users
  resources :channels
  resources :discussions do
    resources :replies, only: [:create, :destroy]
  end
  resources :admin_permissions

  root "discussions#index"
end
