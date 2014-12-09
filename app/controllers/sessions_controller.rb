class SessionsController < ApplicationController

  before_action :guest?, only: [:new, :create]

  def new
    @user = User.new
  end

  def create
    email = params[:session][:email]
    email.downcase! if email
    user = User.find_by(email: email)
    if user && user.authenticate(params[:session][:password])
      log_in user
      redirect_to user
    else
      render 'new'
    end
  end

  def destroy
    logout if logged_in?
    redirect_to root_url
  end

end
