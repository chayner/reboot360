Rails.application.routes.draw do
  resources :lessons, :only => [:show, :index]
  get 'site/index'

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users
  match '/404' => 'errors#not_found'            , :via => [:get, :post]
  match '/422' => 'errors#unprocessable_entity' , :via => [:get, :post]
  match '/500' => 'errors#application_error'    , :via => [:get, :post]
  root :to => 'site#welcome'

  match '/profile' => 'users#profile', via: [:get, :patch], :as => :profile
  match '/promote' => 'site#promote', via: [:get], :as => :promote
  match '/training' => 'training#index', via: [:get], :as => :training
  match '/training/build' => 'training#index', via: [:get], :as => :training_build
  match '/training/lead' => 'training#lead', via: [:get], :as => :training_lead
  match '/training/grow' => 'training#grow', via: [:get], :as => :training_grow
  match '/training/manage' => 'training#manage', via: [:get], :as => :training_manage


end
