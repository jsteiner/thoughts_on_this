Discepto::Application.routes.draw do
  resource :session, :controller => 'sessions', only: [:create]
  resource :dashboard, only: [:show]
  resources :image_subjects, only: [:create]
  resources :discussions, only: [:show] do
    resources :messages, only: [:create]
    resources :guests, only: [:create]
  end
  root to: 'pages#show', :id => 'homepage'
end
