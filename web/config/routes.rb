Rails.application.routes.draw do
  get 'account/login'

  get 'account/crear_cuenta'

  get 'account/recuperar_cuenta'

  get 'parkin/nuevo'

  get 'contact/contactenos'

<<<<<<< HEAD
  get 'home/index'

  get 'home/about'
  get "home/recuperar_contrasena"

=======

  get 'home/index'

  get 'home/about'
  
>>>>>>> bd76ac4394fb641671d2d61a22f16300d2afba50
  get 'home/testimonio'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'home#index'
  
  get 'home/about'
  get "home/tu_parqueo"

end
