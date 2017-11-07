Rails.application.routes.draw do
  root 'welcome#index'
  get 'articles/blog'

  resources :contacts
  resources :articles do
  	resources :comments
  end  
end
