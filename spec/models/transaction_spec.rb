require 'rails_helper'
describe Transaction do
  describe 'Transactionモデルの単体テスト' do
    before { create(:user)
             create(:card) 
             create(:category)
             create(:product)
            }
    
    context '登録成功パターン' do

      example "商品ID、カードID、ユーザーIDがあれば登録できる" do
        transaction = build(:transaction)
        
        transaction.valid?
        expect(transaction).to be_valid
      end

    end

    context '登録失敗パターン' do

      example "商品IDが空の場合、登録できない" do
        transaction = build(:transaction, product_id: nil)
        transaction.valid?
        expect(transaction.errors[:product_id]).to include("can't be blank")
      end

      example "カードIDが空の場合、登録できない" do
        transaction = build(:transaction, card_id: nil)
        transaction.valid?
        expect(transaction.errors[:card_id]).to include("can't be blank")
      end

      example "ユーザーIDが空の場合、登録できない" do
        transaction = build(:transaction, user_id: nil)
        transaction.valid?
        expect(transaction.errors[:user_id]).to include("can't be blank")
      end

      example "取引状況が空の場合、登録できない" do
        transaction = build(:transaction, status: nil)
        transaction.valid?
        expect(transaction.errors[:status]).to include("can't be blank")
      end

      example "商品が存在しない場合、登録できない" do
        transaction = build(:transaction, product_id: 2)
        transaction.valid?
        expect(transaction.errors[:product]).to include("must exist")
      end

      example "カードが存在しない場合、登録できない" do
        transaction = build(:transaction, card_id: 2)
        transaction.valid?
        expect(transaction.errors[:card]).to include("must exist")
      end

      example "ユーザーが存在しない場合、登録できない" do
        transaction = build(:transaction, user_id: 2)
        transaction.valid?
        expect(transaction.errors[:user]).to include("must exist")
      end
    end
  end
end
