class PasswordResetsController < ApplicationController


  def create
    user = User.find_by_email(params[:email])
    
    user.send_password_reset if user
   # flash[:notice] = 'E-mail sent with password reset instructions.'
   # redirect_to new_session_path
  end

  def edit
    @user = User.find_by_password_reset_token!(params[:id])
  end
  def update
    @user = User.find_by_password_reset_token!(params[:id])
    
    if @user.update(user_params)
      render json: "password link has been updated"
    else
      redirect_to 'http://localhost:4200/login'
    end
  end
  private
  # Never trust parameters from the scary internet, only allow the white list through.
  def user_params
    params.permit(:password)
  end
end
