Rails.application.routes.draw do
  resources :lessons, :only => [:show, :index]
  get 'site/index'

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users
  match '/404' => 'errors#not_found'            , :via => [:get, :post]
  match '/422' => 'errors#unprocessable_entity' , :via => [:get, :post]
  match '/500' => 'errors#application_error'    , :via => [:get, :post]
  root :to => 'site#start'

  match '/profile' => 'users#profile', via: [:get, :patch], :as => :profile
  match '/promote' => 'site#promote', via: [:get], :as => :promote
  match '/start' => 'start#index', via: [:get], :as => :start
  match '/start/build' => 'start#index', via: [:get], :as => :start_build
  match '/start/lead' => 'start#lead', via: [:get], :as => :start_lead
  match '/start/grow' => 'start#grow', via: [:get], :as => :start_grow
  match '/start/manage' => 'start#manage', via: [:get], :as => :start_manage


end
