Rails.application.routes.draw do

  resources :companies do
    resources :jobs
    resources :contacts, only: [:create]
  end

  resources :categories, except: :destroy

  resources :jobs, only: [:show, :index] do
    resources :comments, only: [:create]
  end

  get '/dashboard', to: 'dashboard#index'
end
