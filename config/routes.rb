Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  root "queries#index"
  
  resources :queries, only: [:index, :new, :create, :destroy]

  match "queries/:id/favourite" => "queries#favourite", via: :patch, as: "query_favourite"
end
