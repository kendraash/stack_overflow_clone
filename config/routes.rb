Rails.application.routes.draw do
  resources :users

  resources :questions

  resources :questions do
    resources :answers
  end

  get "/sign-in" => "sessions#new"
  post "/sign-in" => "sessions#create"
  get "/sign-out" => "sessions#destroy", as: :sign_out

  root :to => 'questions#index'

  get "/admin" => "admin#index"
  # namespace :admin do
  #   get '', to: 'dashboard#index', as: '/'
  # end
  
end
