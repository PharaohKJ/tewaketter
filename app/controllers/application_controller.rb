class ApplicationController < ActionController::Base
  helper_method :current_user,
                :logged_in?,
                :authenticate,
                :current_invite,
                :current_tewake_uid

  private

  def current_user
    return unless session[:user_id]
    @current_user ||= User.find_by!(uid: session[:user_id])
  end

  def logged_in?
    !!session[:user_id]
  end

  def authenticate
    return if logged_in?
    redirect_to root_path, alert: "ログインしてください"
  end

  def current_invite
    InviteCode.find(session[:invite_id])
  end

  def current_tewake_uid
    session[:uid]
  end
end
