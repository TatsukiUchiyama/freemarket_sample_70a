class TransactionsController < ApplicationController
  require "payjp"

  def new
    @transaction = Transaction.new
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
