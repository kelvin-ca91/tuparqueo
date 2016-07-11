Rails.application.routes.draw do
<<<<<<< HEAD
  get 'account/login'

  get 'account/crear_cuenta'

  get 'account/recuperar_cuenta'
=======
  get 'contact/contactenos'


>>>>>>> 4716046213d4d9543308a4c9b12fc3e4a9919191

  get 'home/index'

  get 'home/about'
  
  get 'home/testimonio'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'home#index'
end
