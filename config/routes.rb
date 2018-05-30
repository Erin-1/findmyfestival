Rails.application.routes.draw do

  devise_for :users
  root to: 'pages#home'

  get 'dashboards/my_festivals', to: 'dashboards#my_festivals'
  get 'dashboards/my_trips', to: 'dashboards#my_trips'
  get 'dashboards/my_guests', to: 'dashboards#my_guests'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :festivals do
    resources :bookings, except: [:index, :show]
  end
  resources :bookings, only: [:index, :show] do
    resources :reviews, except: [:index, :show, :update, :edit, :destroy]
  end
  resources :reviews, only: [:index, :show, :update, :edit, :destroy]

end
