class OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def google_oauth2
    user = User.from_omniauth(request.env['omniauth.auth'])
    if user.persisted?
      sign_in_and_redirect user
    else
      session['devise.user_attributes'] = user.attributes
      flash.notice = 'You need to sign in through Google in order to access the site!'
      redirect_to root
    end
  end
end
