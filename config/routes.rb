ThoughtsOnThis::Application.routes.draw do
  match 'mockups/profile' => 'mockups#profile'

  resource :session, :controller => 'sessions', only: [:create]
  resource :dashboard, only: [:show], path: 'arkboard'
  resources :image_subjects, only: [:create, :show]
  resources :text_subjects, only: [:create]
  resources :discussions, exclude: [:destroy], path: 'llaborate' do
    resources :messages, only: [:create]
    resources :names, only: [:create]
  end
  root to: 'pages#show', :id => 'homepage'
end
