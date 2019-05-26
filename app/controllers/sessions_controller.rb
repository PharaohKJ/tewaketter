class SessionsController < ApplicationController
  def create
    user = User.find_or_create_from_auth(request.env['omniauth.auth'])
    session[:target_account_uid] = user.uid
    session[:user_id] = user.uid
    flash[:notice] = "ユーザ認証が完了しました。"
    target = Config.find_by(user_id: user.id)
    if target.nil?
      target = Config.create(user_id: user.id)
    end
    redirect_to edit_config_path(target)
  end

  def destroy
    reset_session
    flash[:notice] = "ログアウトしました。"
    redirect_to root_path
  end

  def invite
    code = InviteCode.find_by(code: params[:code])
    if code.nil?
      flash[:notice] = '招待コードが無効です'
      redirect_to root_path
      return
    end

    unless (code.start...code.finish.tomorrow).include?(Time.current)
      flash[:notice] = 'この招待コードは時間切れです'
      redirect_to root_path
      return
    end

    session[:invite_id] = code.id
    session[:uid] ||= SecureRandom.uuid
    redirect_to new_tweet_path
  end
end
