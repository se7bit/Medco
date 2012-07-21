class SessionController < ApplicationController
  def new
  end

  def create
    user = User.find_by_id(params[:session][:id])
    if user && user.authenticate(params[:session][:password])
      sign_in user
      redirect_back_or user
    else
      flash.now[:error] = 'Invalid username/password combination'
      render 'new'
    end
  end

  def destroy
    sign_out
    redirect_to signin_path
  end
end