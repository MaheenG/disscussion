Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }

  root 'home#index'

  # Nested discussions inside channels
  resources :channels, param: :slug do
    # All discussion actions except :index, which is global below
    resources :discussions, param: :slug, except: [:index] do
      resources :replies, except: [:show, :index]
    end
  end

  # Global discussions index (shows discussions from all channels)
  resources :discussions, only: [:index]

  namespace :admin do
    root 'dashboard#index'
    resources :users
    resources :channels
    resources :discussions
    resources :replies
  end

  # API routes for AJAX calls
  namespace :api do
    namespace :v1 do
      resources :discussions do
        resources :replies
      end
    end
  end
end
