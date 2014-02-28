Blocipedia::Application.routes.draw do

  get "collaborator/index"

  get "collaborator/create"

  get "collaborator/destroy"

devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks', registrations: 'users/registrations' }  

  resources :wikis do 
    resources :articles, except: [:index]
  end

  resources :charges
  
  match "about" => 'welcome#about', via: :get

  root :to => 'welcome#index'
end
