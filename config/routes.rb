Rails.application.routes.draw do
  resources :users

  get "/sign-in" => "sessions#new"
  post "/sign-in" => "sessions#create"
  get "/sign-out" => "sessions#destroy", as: :sign_out

end
