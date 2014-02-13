Blocipedia::Application.routes.draw do

  devise_for :users
 
  resources :articles

  match "about" => 'welcome#about', via: :get

  root :to => 'welcome#index'
end
