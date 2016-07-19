Rails.application.routes.draw do
  
  
  resources :parkings

  devise_for :users , :controllers => { :omniauth_callbacks => "users/omniauth_callbacks", :omniauth_authorize => 'users/omniauth_authorize' }
  
  get 'home/contact'
  get 'home/about'
  get 'home/account'
  post 'home/mailcontact'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html  
  
  root 'home#index'
  

end