Rails.application.routes.draw do
  resources :issue_types
  resources :resolutions
  resources :statuses
  resources :categories
  resources :projects
  devise_for :users
  resources :comments
  resources :issues do
    collection do
      post :import
    end
    member do
      put 'resolve'
    end
  end
  root to: 'issues#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
