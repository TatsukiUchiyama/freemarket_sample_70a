require 'rails_helper'
describe User do
  describe '#create ユーザー登録に関するバリデーションのテスト' do
    context 'can save' do

      it "ユーザー情報が全て揃っていれば登録できる" do
        user = build(:user)
        user.valid?
        expect(user).to be_valid
      end

    end

    context 'can not save' do

      it "ニックネームが空の状態で登録できない" do
        user = build(:user, nickname: nil)
        user.valid?
        expect(user.errors[:nickname]).to include("can't be blank")
      end

      it "emailが空の状態で登録できない" do
        user = build(:user, email: nil)
        user.valid?
        expect(user.errors[:email]).to include("can't be blank")
      end

      it "emailに＠がないと登録できない" do
        user = build(:user, email: "t70.uchiyama.tatsukigmail.com")
        user.valid?
        expect(user.errors[:email]).to include("is invalid")
      end

      it "emailにドメイン名がないと登録できない" do
        user = build(:user, email: "t70.uchiyama.tatsuki@gmailcom")
        user.valid?
        expect(user.errors[:email]).to include("is invalid")
      end

      it "emailは同一のアドレスでは登録できない" do
        user = create(:user, email: "t70.uchiyama.tatsuki@gmail.com")
        another_user = build(:user, email: "t70.uchiyama.tatsuki@gmail.com")
        another_user.valid?
        expect(another_user.errors[:email]).to include("has already been taken")
      end

      it "パスワードがないと登録できない" do
        user = build(:user, password: nil)
        user.valid?
        expect(user.errors[:password]).to include("can't be blank")
      end

      it "パスワードと確認パスワードが同一でないと登録ができない" do
        user = build(:user, password_confirmation: 1111111)
        user.valid?
        expect(user.errors[:password_confirmation]).to include("doesn't match Password")
      end

      it "パスワードが７文字未満だと登録できない" do
        user = build(:user, password: "000000", password_confirmation: "000000")
        user.valid?
        expect(user.errors[:password]).to include("is too short (minimum is 7 characters)")
      end

      it "family_name_kanjiが空だと登録できない" do
        user = build(:user, family_name_kanji: "")
        user.valid?
        expect(user.errors[:family_name_kanji]).to include("can't be blank")
      end

      it "first_name_kanjiが空だと登録できない" do
        user = build(:user, first_name_kanji: "")
        user.valid?
        expect(user.errors[:first_name_kanji]).to include("can't be blank")
      end

      it "family_name_kanaが空だと登録できない" do
        user = build(:user, family_name_kana: nil)
        user.valid?
        expect(user.errors[:family_name_kana]).to include("can't be blank")
      end

      it "first_name_kanaが空だと登録できない" do
        user = build(:user, first_name_kana: nil)
        user.valid?
        expect(user.errors[:first_name_kana]).to include("can't be blank")
      end

      it "family_name_kanjiが漢字でなければ登録できない" do
        ['A', '1', '@', 'a'].each do |value|
          user = build(:user, family_name_kanji: value)
          user.valid?
          expect(user.errors[:family_name_kanji]).to include("is invalid")
        end
      end

      it "first_name_kanjiが漢字でなければ登録できない" do
        ['A', '1', '@', 'a'].each do |value|
          user = build(:user, first_name_kanji: value)
          user.valid?
          expect(user.errors[:first_name_kanji]).to include("is invalid")
        end
      end

      it "family_name_kanaがカタカナでなければ登録できない" do
        ['A', '1', '@', 'a', '亜', 'あ'].each do |value|
          user = build(:user, family_name_kana: value)
          user.valid?
          expect(user.errors[:family_name_kana]).to include("is invalid")
        end
      end

      it "first_name_kanaがカタカナでなければ登録できない" do
        ['A', '1', '@', 'a', '亜', 'あ'].each do |value|
          user = build(:user, first_name_kana: value)
          user.valid?
          expect(user.errors[:first_name_kana]).to include("is invalid")
        end
      end

      it "year_idが0(-)だと登録できない" do
        user = build(:user, year_id: 0)
        user.valid?
        expect(user.errors[:year_id]).to include("is invalid")
      end

      it "month_idが0(-)だと登録できない" do
        user = build(:user, month_id: 0)
        user.valid?
        expect(user.errors[:month_id]).to include("is invalid")
      end

      it "day_idが0(-)だと登録できない" do
        user = build(:user, day_id: 0)
        user.valid?
        expect(user.errors[:day_id]).to include("is invalid")
      end
    end
  end
end

