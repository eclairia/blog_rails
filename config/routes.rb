Rails.application.routes.draw do

  ###########################################

  # Espace utilisateur lambda
  root 'welcome#index'
  get 'blog', to: 'articles#blog'
  get '/about', to: 'static#index'

  devise_for :users, controllers: {
      sessions: 'users/sessions'
  }

  resources :contacts

  resources :articles, only: [:blog, :show] do
    resources :comments
  end

  ###########################################

  # Espace d'administration

  devise_for :admin, controllers: {
      sessions: 'admin/sessions'
  }

  namespace :admin do
    root 'articles#index'
    resources :articles, except: [:blog, :show] do
      get 'showAdmin'
    end

    get 'articles/publish/:id', to: 'articles#publish', as: 'publish_article'

    resources :categories
  end

  ###########################################

  # Gestion des erreurs (404)
  if Rails.env.production?
    get '404', to: 'errors#e404'
    get '500', to: 'errors#e500'
  end

end
