Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'static_pages#home'
  get '/signup', to: 'users#new'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  resources :users do
    resources :invitations
  end

  resources :events do
    resources :invitations
  end

  resources :invitations do
    delete :reject, on: :member
    delete :accept, on: :member
  end

end
