class SessionsController < ApplicationController

  def new
    @user = User.new
  end

  def create
    user = User.find_by(email: params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      render plain: 'dude'
    else
      render 'new'
    end
  end

  def destroy

  end

end
