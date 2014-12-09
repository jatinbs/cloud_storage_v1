module SessionsHelper
  def log_in(user)
    session[:user_id] = user.id
  end

  def current_user
    if user_id = session[:user_id]
      @current_user ||= User.find_by(id: user_id)
    elsif user_id = cookies.signed[:user_id]
      user = User.find_by(id: user_id)
      if user && user.authenticated?(cookies[:remember_token])
        log_in user
        @current_user = user
      end
    end
  end

  def logged_in?
    !current_user.nil?
  end

  def logout
    session.delete(:user_id)
    @current_user = nil
  end

  def authenticate?
    if !logged_in?
      redirect_to root_path
    end
  end

  def current_user? user
    authenticate?
    if current_user && current_user.id != user.id
      redirect_to current_user
    end
  end

  def guest?
    if logged_in?
      redirect_to current_user
    end
  end

end
