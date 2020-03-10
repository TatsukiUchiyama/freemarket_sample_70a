class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  # ベーシック認証を実行（本番環境のみ）
  before_action :basic_auth, if: :production?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :email, :password,:password_confirmation,:family_name_kanji,:first_name_kanji,
                                                       :family_name_kana,:first_name_kana,:year_id,:month_id, :day_id,
                                                       :municipalities,:family_name_kanji,:first_name_kanji,:family_name_kana,:first_name_kana,
                                                       :postal_code,:block_number,:building_name,:room_number,:phone_number])
  end

  private
  def production?
    Rails.env.production?
  end
  
  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV["BASIC_AUTH_USER"] && password == ENV["BASIC_AUTH_PASSWORD"]
    end
  end

end
