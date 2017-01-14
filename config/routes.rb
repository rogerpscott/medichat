Rails.application.routes.draw do
  ActiveAdmin.routes(self)
  get 'patient_profiles/update'

  devise_for :users
  root to: 'conversations#new'
  mount ActionCable.server => '/cable'
  resources :conversations, param: :access_token
  resources :messages
  resources :patient_profiles, only: [:edit, :update]
  resources :pages
  resources :patient_profiles do
    member do
      post 'accept_terms'
    end
  end

  namespace :doctor do
    resources :conversations, param: :access_token
    resources :patient_profiles, only: [:show]
    resources :messages
    post "make_available", to: "doctor_profiles#make_available"
    post "make_unavailable", to: "doctor_profiles#make_unavailable"
  end

  get "log_out_well", to: "application#log_out_well"

  # Serve websocket cable requests in-process
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
