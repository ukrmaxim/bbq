class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  skip_before_action :verify_authenticity_token, only: %i[facebook github]

  def facebook
    auth_type 'Facebook'
  end

  def github
    auth_type 'GitHub'
  end

  private

  def auth_type(type)
    @user = User.from_omniauth(request.env['omniauth.auth'])

    if type == 'GitHub' && @user.nil?
      session['devise.auth_data'] = request.env['omniauth.auth'].except(:extra)
      redirect_to new_user_registration_url
      set_flash_message(:notice, :github, kind: type) if is_navigational_format?
    else
      sign_in_and_redirect @user, event: :authentication
      set_flash_message(:notice, :success, kind: type) if is_navigational_format?
    end
  end

  def failure
    redirect_to root_path
  end
end
