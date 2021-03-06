class SessionsController < ApplicationController
  def new
  end
  
  def create
    user = User.find_by_slug(params[:session][:slug])
    if user && user.authenticate(params[:session][:password])
      sign_in user
      redirect_to root_path
    else
      flash.now[:error] = 'Invalid user/password combination'
      render 'new'
    end
  end

  def destroy
    sign_out
    redirect_to root_path
  end
end
