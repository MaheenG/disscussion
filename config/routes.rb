# Is file mein application k sare routes define kiye gaye hain
Rails.application.routes.draw do
  # User authentication k routes (login, signup, etc.)
  devise_for :users, controllers: { registrations: 'registrations' }
  
  # Discussions k routes, aur har discussion k andar replies k routes
  resources :discussions do
    resources :replies
  end

  # Admin panel k routes, admin dashboard aur users management k liye
  namespace :admin do
    get 'dashboard', to: 'dashboard#index'
    resources :users
  end

  # Root route - application ka homepage
  root 'discussions#index'
end
