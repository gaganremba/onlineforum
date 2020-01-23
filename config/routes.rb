Rails.application.routes.draw do
  root 'questions#index'
  devise_for :users

  resources :questions do
  	resources :comments
  	member do
  		get :answer
  	end
  end
  resources :comments do
    resources :comments
  end
end
