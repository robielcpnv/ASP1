Rails.application.routes.draw do
  resources :categories
  resources :promotions
  resources :type_people
  resources :semesters
  resources :people
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
