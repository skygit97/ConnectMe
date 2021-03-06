Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    resources :session, only: [:create, :destroy]
    resources :users, only: [:index, :create, :show, :update, :destroy]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'static_pages#root'
end
