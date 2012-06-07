Discepto::Application.routes.draw do
  resource :session, :controller => 'sessions', only: [:create]
  resource :dashboard, only: [:show]
  root to: 'pages#show', :id => 'homepage'
end
