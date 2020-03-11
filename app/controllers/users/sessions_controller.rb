class Users::SessionsController < Devise::SessionsController
  # before_action :set_user, only: [:create]


  # def new
  # end

  # def create
  # if @user.authenticate(session_params[:password]) 
  #   sign_in(@user)
  #     redirect_to  root_path
  #   else
  #     redirect_to sign_in_path
  #   end
  # end
  
  # def destroy
  #   sign_out
  #   redirect_to sign_in_path
  # end

  # private

  # def set_user
  #   @user = User.find_by!(email: session_params[:email])
  # rescue
  #   redirect_to sign_in_path
  # end

  # def session_params
  #   params.require(:session).permit(:email, :password)
  # end

end
