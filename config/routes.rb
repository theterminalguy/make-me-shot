Rails.application.routes.draw do

namespace :api do
  namespace :v1 do
    get '/users/info/:auth_token' => 'users#info'
    get '/users/links/:auth_token' => 'users#links'
    get '/users/links/recent/:auth_token' => 'users#recent'
    get '/users/links/popular/:auth_token' => 'users#popular_urls'
    get '/users/popular/:auth_token' => 'users#popular_users'
  end
end

  resources :visits
  get '/recent_urls' => 'links#recent', as: 'recent_urls'
  get '/top_users' => 'links#top_users', as: 'top_users'
  get '/popular_links' => 'links#popular_links', as: 'popular_users'
  resources :links
  devise_for :users, :path => '',
             :path_names => {
                    :sign_in => 'login',
                    :sign_out => 'logout',
                    :sign_up => 'register'
                    },
             :controllers => {
              :omniauth_callbacks => "callbacks"
             }
  get '/dashboard' => 'links#index', as: 'user_dashboard'
  get '/link/new_short' => 'links#new', as: 'new_short'
  get '/link/:id' => 'links#show', as: 'show_link'
  get '/update/:id/' => 'links#edit', as: 'update_link'
  get '/:short_url' => 'redirect#show', as: 'short'
  get '/pages/:page' => 'pages#show'
  root 'pages#index' 
end