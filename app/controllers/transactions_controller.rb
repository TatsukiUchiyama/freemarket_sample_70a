class TransactionsController < ApplicationController
  require "payjp"

  def new
    @transaction = Transaction.new

    # 最初のカードを取得
    card = Card.where(user_id: current_user.id).first

    # 秘密鍵を設定
    Payjp.api_key = 'sk_test_a2dd327111d09e322058d1c2'

    # 所有者を取得
    customer = Payjp::Customer.retrieve(card.customer_id)

    # 所有者に紐づくカードから、idを指定してカードを取得する
    @card_payjp = customer.cards.retrieve(card.card_id)
  end

  def create

    # トップページへ遷移する
    redirect_to controller: 'products', action: 'index'
  end

  def purchase
    Payjp.api_key = "sk_test_a2dd327111d09e322058d1c2"
    Payjp::Charge.create(
      amount: 809, # 決済する値段
      card: params['payjp-token'], # フォームを送信すると作成・送信されてくるトークン
      currency: 'jpy'
    )
  end
end
