Rails.application.routes.draw do
  ActiveAdmin.routes(self)
  resources :campaigns, only: [:index, :show] do
    resources :donations, only: [:create]
  end

  resources :donations, only: [:show] do
    member do
      get "confirm/:confirmation_code", action: "confirm"
    end
  end

  root to: "campaigns#index"
end
