Blocipedia::Application.routes.draw do

resources :collaborator

devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks', registrations: 'users/registrations' }  

resources :wikis 

resources :charges
  
match "about" => 'welcome#about', via: :get

root :to => 'welcome#index'

end
