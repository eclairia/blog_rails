Rails.application.routes.draw do
  devise_for :users, controllers: {
      sessions: 'users/sessions'
  }

  devise_for :admin, controllers: {
      sessions: 'admin/sessions'
  }

  resources :categories
  root 'welcome#index'
  get 'articles/blog'
  get '/about', to: 'static#index'

  get 'article/publish/:id', to: 'articles#publish', as: 'publish_article'

  resources :contacts
  resources :articles do
  	resources :comments
  	  	get 'showAdmin'
  end
end
