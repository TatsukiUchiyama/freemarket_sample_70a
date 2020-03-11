class CardsController < ApplicationController
  require "payjp"

  before_action :set_card

  def new # カードの登録画面。送信ボタンを押すとcreateアクションへ。
    card = Card.where(user_id: current_user.id).first
    redirect_to controller: 'products', action: 'index' if card.present?
  end

 # indexアクションはここでは省略

  def create #PayjpとCardのデータベースを作成
    Payjp.api_key = 'sk_test_a2dd327111d09e322058d1c2'
    binding.pry

    if params['payjp-token'].blank?
      redirect_to action: "new"
    else
      # トークンが正常に発行されていたら、顧客情報をPAY.JPに登録します。
      customer = Payjp::Customer.create(
        description: 'test', # 無くてもOK。PAY.JPの顧客情報に表示する概要です。
        # email: current_user.email,
        card: params['payjp-token'], # 直前のnewアクションで発行され、送られてくるトークンをここで顧客に紐付けて永久保存します。
        # metadata: {user_id: current_user.id} # 無くてもOK。
      )
      binding.pry
      @card = Card.new(user_id: current_user.id, customer_id: customer.id, card_id: customer.default_card)
      if @card.save
        binding.pry
        redirect_to controller: 'products', action: 'index'
      else
        redirect_to action: "new"
      end
    end
  end

  private

  def set_card
    @card = Card.where(user_id: current_user.id).first if Card.where(user_id: current_user.id).present?
  end
end
