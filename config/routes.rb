Gitcare::Application.routes.draw do

  root 'pages#home'

  devise_for :users, :path => '',
                     :path_names => { :sign_in => 'login', :sign_out => 'logout', :sign_up => 'register' },
                     :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  get 'u/:id' => 'users#show', as: :user

  # Pages
  get 'about' => 'pages#about'
  get 'dashboard' => 'pages#dashboard'

  # Social Connections
  get 'disconnect' => 'users#disconnect'

end
