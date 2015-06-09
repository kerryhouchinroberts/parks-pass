class SessionsController < ApplicationController

  def create
    uid = env['omniauth.auth']['uid']
    session[:user_id] = uid
    user = User.find_or_create_by(oauth_user_id: uid)
    user.update_attributes(token: env['omniauth.auth']['credentials']['token'])
    user.update_attributes(name: env['omniauth.auth']['info']['name'])
    user.update_attributes(image_url: env['omniauth.auth']['info']['image'])
      redirect_to root_path
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end

end
