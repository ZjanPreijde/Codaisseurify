Rails.application.routes.draw do
  root to: 'pages#home'

  resources :artists
  resources :artists do
    resources :songs
  end

  get "home" => 'pages#home'
end
