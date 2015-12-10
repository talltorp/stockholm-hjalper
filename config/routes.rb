Rails.application.routes.draw do
  ActiveAdmin.routes(self)
  resources :campaigns, only: [:index, :show] do
    resources :donations, only: [:create]
  end

  root to: "campaigns#index"
end
