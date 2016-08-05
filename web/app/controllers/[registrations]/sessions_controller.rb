class [registrations]::SessionsController < Devise::SessionsController
# before_action :configure_sign_in_params, only: [:create]
def new
end
def create
  user = User.find_by_email(params[:email])
  if user && user.authenticate(params[:password])
    cookies.permanent[:auth_token] = user.auth_token
    redirect_to root_url, :notice => "Logged in!"
    else
      flash.now.alert = "invalid email or password"
      render "new"
    end
  end
  
  def destroy
    cookies.delete(:auth_token)
    redirect_to root_url, :notice => "Logged out"
  end
end

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
