Rails.application.routes.draw do
  get 'admin', to: 'backoffice/dashboard#index'

  namespace :backoffice do
    resources :categories, except: [:show]
    resources :topics, except: [:show]
    resources :likes, except: [:show]
    resources :comments, except: [:show,]
    resources :admins, except: [:show]
    resources :members, except: [:show, :destroy]
    get 'dashboard', to:'dashboard#index'
  end

  namespace :site do
    get 'home', to: 'home#index'
  end

  devise_for :admins, :skip => [:registrations]
  devise_for :members
  root 'site/home#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
