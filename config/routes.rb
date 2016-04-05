Rails.application.routes.draw do
  root 'pages#index'
  resources :visits
  get '/recent_urls' => 'links#recent', as: 'recent_urls'
  get '/top_users' => 'links#top_users', as: 'top_users'
  get '/popular_links' => 'links#popular_links', as: 'popular_links'
  resources :links
  devise_for :users, :path => '',
             :path_names => {
                    :sign_in => 'login',
                    :sign_out => 'logout',
                    :sign_up => 'register'
                    }
  get '/dashboard' => 'links#index', as: 'user_dashboard'
  get '/link/new_short' => 'links#new', as: 'new_short'
  get '/link/:id' => 'links#show', as: 'show_link'
  get '/update/:id/' => 'links#edit', as: 'update_link'
  get '/:short_url' => 'redirect#show', as: 'short'
  get '/pages/:page' => 'pages#show'
end
