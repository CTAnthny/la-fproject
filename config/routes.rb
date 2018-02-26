Rails.application.routes.draw do
  devise_for :members, controllers: { registrations: 'members/registrations' }

  unauthenticated do
    as :member do
      root to: 'devise/sessions#new'
    end
  end

  # root to dashboard later
  root to: 'main_pages#home'

  resources :projects do
    member do
      get 'join'
      put 'join'
      patch 'join'
    end
    resources :tasks
  end
end
