Rails.application.routes.draw do
  get 'contact/contactenos'



  get 'home/index'

  get 'home/about'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'home#index'
end
