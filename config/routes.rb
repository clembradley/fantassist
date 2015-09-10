Rails.application.routes.draw do
  get 'settings', to: 'settings#index'

  # You can have the root of your site routed with "root"
   root 'draft#index'

   devise_for :users, controllers: {omniauth_callbacks: 'omniauth_callbacks'}

   devise_scope :user do
     get 'sign_in', :to => 'sessions#new', :as => :new_user_session
     get 'sign_out', :to => 'devise/sessions#destroy', :as => :destroy_user_session
   end

   namespace :api do
     namespace :v1 do
       resources :stats, only: [:index, :show]
       resources :draft_picks, only: [:create, :destroy, :index]
     end
   end

   #get 'api/v1/players/:player_id/stats/:year' => 'api/v1/stats#show'
end
