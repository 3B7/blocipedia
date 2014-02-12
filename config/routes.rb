Blocipedia::Application.routes.draw do
 
  resources :articles

  match "About" => 'welcome#about', via: :get

  root :to => 'welcome#index'
end
