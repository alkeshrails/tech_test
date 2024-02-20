Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :person
      resources :details
    end
  end

  root to: 'api/v1/person#index'
end
