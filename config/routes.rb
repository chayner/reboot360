Rails.application.routes.draw do
  resources :lessons, :only => [:show, :index]
  resources :training, :only => [:show, :index]
  get 'site/index'

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users
  match '/404' => 'errors#not_found'            , :via => [:get, :post]
  match '/422' => 'errors#unprocessable_entity' , :via => [:get, :post]
  match '/500' => 'errors#application_error'    , :via => [:get, :post]
  root :to => "site#welcome"

  match '/dashboard' => 'site#dashboard', via: [:get], :as => :dashboard

  match '/profile' => 'users#profile', via: [:get, :patch], :as => :profile
  match '/promote' => 'site#promote', via: [:get], :as => :promote

  match '/download/:id/:filename' => 'download#show', via: [:get], :as => :download_link

end
