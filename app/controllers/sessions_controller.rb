class SessionsController < ApplicationController
  
  def index
    redirect_to root_path
  end

  def new
  end

  def create
  	user = User.find_by_userid(params[:userid])
  	if user && user.authenticate(params[:password])
  		session[:user_id] = user.id
  		redirect_to root_path,  
      flash[:success] = "Welcome #{user.userid}, you successfully Signed In!"
  	else
  		redirect_to new_session_path,
      flash[:danger] = 'Invalid email/password combination'
  	end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, 
    flash[:notice] = "You successfully Logged Out!" 
  end
end
