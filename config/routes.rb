Gitcare::Application.routes.draw do

  root 'pages#home'

  devise_for :users, :path => '',
                     :path_names => { :sign_in => 'login', :sign_out => 'logout', :sign_up => 'register' },
                     :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  get 'u/:id' => 'users#show', as: :user

  # Statuses
  resources :statuses, path: 'status'

  # Pages
  get 'about' => 'pages#about'
  get 'dashboard' => 'pages#dashboard'
  #get 'status' => 'pages#status'

  # Social Connections
  get 'disconnect' => 'users#disconnect'

end
