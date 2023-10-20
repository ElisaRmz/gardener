Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  root "main_pages#index"

  get "/moon_phases", to: "moon_phases#index"

  resources :lands
  resources :seeded_plants
  resources :seeded_plant_care_tasks
  resources :plants
  resources :plant_cares
end
