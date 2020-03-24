class UsersController < ApplicationController

  def show    
    @user = User.find(params[:id])
    redirect_to root_path unless user_signed_in? && current_user.id == @user.id
  end
  
  def card
    @card = Card.find_by(user_id: current_user.id)

    # 現在のユーザーがカードを登録済みの場合、カードの情報（payjp）を取得する
    if @card
      # 秘密鍵を設定
      Payjp.api_key = Rails.application.credentials.PAYJP_PRIVATE_KEY

      # 所有者を取得
      customer = Payjp::Customer.retrieve(@card.customer_id)

      # 所有者に紐づくカードIDから、idを指定してカード情報（payjp）を取得する
      @card_payjp = customer.cards.retrieve(@card.card_id)
    end
  end
end
