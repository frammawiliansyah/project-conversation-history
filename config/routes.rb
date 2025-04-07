Rails.application.routes.draw do
  root "dashboards#index"

  resources :dashboards
  resources :projects do
    member do
      post :comment
    end
  end

  resources :sessions, path: "auth" do
    collection do
      get :login
      get :register
      get :logout
      post :signin
      post :signup
    end
  end
end
