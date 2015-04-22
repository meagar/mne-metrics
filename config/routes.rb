Rails.application.routes.draw do
  root to: 'events#index'
  resources :events

  Event::TEAMS.each do |name,value|
    get "/#{value}" => 'events#index', team: value
  end

end
