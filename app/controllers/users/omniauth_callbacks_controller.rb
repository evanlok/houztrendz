class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def onvedeo
    @user = User.from_onvedeo(request.env['omniauth.auth'])

    if @user.persisted?
      sign_in_and_redirect @user, event: :authentication #this will throw if @user is not activated
      set_flash_message(:notice, :success, kind: 'Onvedeo') if is_navigational_format?
    else
      session['devise.onvedeo_data'] = request.env['omniauth.auth']
      redirect_to new_user_registration_url
    end
  end
end
