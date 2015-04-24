Rails.application.routes.draw do

  get '/auth/500px/callback' => 'sessions#create'
  get '/login' => 'sessions#login', as: 'login'
  get '/logout' => 'sessions#logout', as: 'logout'
  get '/unauthorized' => 'sessions#unauthorized'

  get '/heartbeat' => 'heartbeat#index'

  resources :news_letters, only: %w(index show create)

  root to: 'events#index'
  resources :events

  Event::TEAMS.each do |name,value|
    get "/#{value}" => 'events#index', team: value
  end

end
