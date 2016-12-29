Rails.application.routes.draw do
  # root 'statics#index'
  # resources :statics
  resources :passwords, controller: "clearance/passwords", only: [:create, :new]
  resource :session, controller: "clearance/sessions", only: [:create]
  resources :users, only: [:index, :show, :edit, :update, :create]

  resources :users, controller: "users",  only: [:create] do
    resource :password,
      controller: "clearance/passwords",
      only: [:create, :edit, :update]
  end
  get "/sign_in" => "clearance/sessions#new", as: "sign_in"
  delete "/sign_out" => "clearance/sessions#destroy", as: "sign_out"
  get "/sign_up" => "clearance/users#new", as: "sign_up"
  get "/auth/:provider/callback" => "sessions#create_from_omniauth"
  root "listings#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :listings do
    resources :bookings, only: [:create]
  end
  resources :bookings, only: [:destroy]
end
