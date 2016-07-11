Rails.application.routes.draw do

  get 'account/login'

  get 'account/crear_cuenta'

  get 'account/recuperar_cuenta'

  get 'contact/contactenos'




  get 'parkin/nuevo'

  get 'contact/contactenos'

  get 'home/index'

  get 'home/about'
  get "home/recuperar_contrasena"

  get 'home/testimonio'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html  
  
  root 'home#index'
  

  get 'home/about'
  get "home/tu_parqueo"

end