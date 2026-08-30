Rails.application.routes.draw do
  get "sys/new" => "sys#new"
  post "sys/create" => "sys#create"
  get "sys/edit" => "sys#edit"
  post "sys/update" => "sys/update"
  post "sys/dstroy" => "sys/destroy"
  get "sys/index" => "sys#index"
  get "sys/:id" => "sys#show"

  post "comments/:log_id/create" => "comments#create"
  get "comments/:id/destroy" => "comments#destroy"
  get "comments/:id/edit" => "comments#edit"
  post "comments/:id/update" => "comments#update"

  get "users/new" => "users#new"
  post "users/create" => "users#create"
  get "users/:id/edit" => "users#edit"
  post "users/:id/update" => "users#update"

  get "login" => "users#login_form"
  post "login" => "users#login"
  get "logout" => "users#logout"
  
  get "users/index" => "users#index"
  get "users/:id" => "users#show"

  get "logs/index" => "logs#index"
  get "logs/new" => "logs#new"
  post "logs/create" => "logs#create"
  post "logs/:id/update" => "logs#update"
  get "logs/:id/edit" => "logs#edit"
  post "logs/:id/destroy" => "logs#destroy"
  get "logs/:id" => "logs#show"

  post "tags/:log_id/create" => "tags#create"
  get "tags/:id" => "tags#show"
  
  get "/" => "home#top"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
