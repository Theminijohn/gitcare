Gitcare::Application.routes.draw do

  get "users/show"
  root 'pages#home'

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  get 'u/:id' => 'users#show', as: :user

  get 'about' => 'pages#about'

  get 'disconnect' => 'users#disconnect'

end
