Rails.application.routes.draw do
  # get 'sessions/new'
  resources :sessions
  resources :users
  get 'welcome/index'
  resources :articles do
  	resources :comments
  	collection do
  		get :search
  	end
  end
  resources :subscribers
  root 'welcome#index'

  resource :posts do
  member do
    get 'comments'
  end

  collection do
    post 'bulk_upload'
    end
end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
