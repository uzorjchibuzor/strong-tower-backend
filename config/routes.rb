Rails.application.routes.draw do
  resources :users

  post '/new_appointment', to: 'appointments#create'
  root "home#index"
end
