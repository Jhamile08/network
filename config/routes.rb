Rails.application.routes.draw do
  resources :categories
  resources :publications
  resources :comments, except: [:new]
  devise_for :users
  devise_scope :user do
    root to: 'devise/sessions#new'
  end
  resources :publications do
    resources :comments, only: %i[new create destroy]
    member do
      patch :toggle_active
    end
  end
end
