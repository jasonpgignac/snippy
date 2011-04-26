Snippy::Application.routes.draw do
  resources :taggings
  resources :tags do
    resources :snippets
  end
  resources :languages do
    resources :snippets
  end
  resources :snippets do
    get 'about', :on => :collection
  end
  root :to => "snippets#index"
  
  match ':controller/:action/:id(.:format)'
end
