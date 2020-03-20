class UsersController < ApplicationController

  def show    
    @user = User.find(params[:id])
    redirect_to root_path unless user_signed_in? && current_user.id == @user.id
  end
  
  def card
    
  end

end
