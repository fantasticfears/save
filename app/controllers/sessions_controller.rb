class SessionsController < ApplicationController
  skip_before_action :verify_authenticity_token, on: [:client_login]

  def client_login
    user = User.find_by_email_or_name(params[:login])
    if user && user.authenticated?(cookies[:remember_token])
      log_in user
      remember user
      render :nothing, status: 200
    end
  end

  def destroy
    user = current_user

    return unless user

    log_out user
    forget user

    render :nothing, status: 200
  end
end
