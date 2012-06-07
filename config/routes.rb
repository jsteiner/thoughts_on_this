Discepto::Application.routes.draw do
  resource :session, :controller => 'sessions', only: [:create]
  resource :dashboard, only: [:show]
  resources :image_subjects, only: [:create]
  resources :discussions, only: [:show]
  root to: 'pages#show', :id => 'homepage'
end
