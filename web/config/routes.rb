Rails.application.routes.draw do
<<<<<<< HEAD
<<<<<<< HEAD
  get 'account/login'

  get 'account/crear_cuenta'

  get 'account/recuperar_cuenta'
=======
=======
  get 'parkin/nuevo'

>>>>>>> ab33a9d2c6ebf931d4747c451ff65c1580c369e4
  get 'contact/contactenos'


>>>>>>> 4716046213d4d9543308a4c9b12fc3e4a9919191

  get 'home/index'

  get 'home/about'
  
  get 'home/testimonio'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'home#index'
end
