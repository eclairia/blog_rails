Rails.application.routes.draw do
  root 'welcome#index'
  get 'articles/blog'
  get '/about', to: 'static#index'

  resources :contacts
  resources :articles do
  	resources :comments
  	  	get 'showAdmin'
  end  
end
