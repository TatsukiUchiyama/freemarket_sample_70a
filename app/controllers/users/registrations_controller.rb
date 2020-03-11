# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  
  def new
    @user = User.new(sign_up_params)
    @address = @user.build_address
  end

  def create
    @user = User.new(sign_up_params)
    unless @user.valid?
      flash.now[:alert] = @user.errors.full_messages
      render :new and return
    end
    session["devise.regist_data"] = {user: @user.attributes}
    session["devise.regist_data"][:user]["password"] = params[:user][:password]
    @address = @user.build_address
    render :new_address
  end

  def new_address
  end

  def create_address
    @user = User.new(session["devise.regist_date"]["user"])
    @address = Address.new(address_params)
    unless @address.valid?
      flash.now[:alert] = @address.errors.full_messages
      render :new_address and return
    end
    @user.build_address(@address.attributes)
    @user.save
    sign_in(:user,@user)
    redirect_to root_path
  end

  protected

  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :email, :password, :family_name_kanji,:first_name_kanji,:family_name_kana,:first_name_kana,:year_id,:month_id,:day_id])
  end

  def address_params
    params.require(:address).permit(:prefecture_id, :municipalities,:family_name_kanji,:first_name_kanji,:family_name_kana,:first_name_kana,
                                    :postal_code,:block_number,:building_name,:room_number,:phone_number)
  end

end
