ThoughtsOnThis::Application.routes.draw do
  resource :session, :controller => 'sessions', only: [:create]
  resource :dashboard, only: [:show], path: 'arkboard'
  resources :image_subjects, only: [:create]
  resources :text_subjects, only: [:create]
  resources :discussions, only: [:index, :show, :edit, :update], path: 'llaborate' do
    resources :messages, only: [:create]
    resources :names, only: [:create]
  end
  root to: 'pages#show', :id => 'homepage'
end
