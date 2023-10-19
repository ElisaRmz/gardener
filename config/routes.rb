Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  root "main_pages#index"

  get "/moon_phases", to: "moon_phases#index"

  get '/go_back', to: 'main_pages#index', as: :go_back

  namespace :api do
    resources :plants do
      resources :crops, only: [:new, :create]
    end
  end
end
