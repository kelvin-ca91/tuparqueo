Rails.application.routes.draw do
  get 'home/index'

  get 'home/about'
  get "home/recuperar_contrasena"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'home#index'
  
  get 'home/about'
  get "home/tu_parqueo"

end
