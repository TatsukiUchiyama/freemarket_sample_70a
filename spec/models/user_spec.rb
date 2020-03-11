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
        expect(user.errors[:email]).to include("正規表現通りに入力してください")
      end

      it "emailにドメイン名がないと登録できない" do
        user = build(:user, email: "t70.uchiyama.tatsuki@gmailcom")
        user.valid?
        expect(user.errors[:email]).to include("正規表現通りに入力してください")
      end

      it "emailは同一のアドレスでは登録できない" do
        user = create(:user, email: "t70.uchiyama.tatsuki@gmailcom")
        another_user = build(:user, email: "t70.uchiyama.tatsuki@gmailcom")
        another_user.valid?
        expect(another_user.errors[:email]).to include("has already been taken")
      end

      it "パスワードがないと登録できない" do
        user = build(:user, password: nil)
        user.valid?
        expect(user.errors[:password]).to include("can't be blank")
      end

      it "パスワードと確認パスワードが同一でないと登録ができない" do
        user = build(:user, password_confirmation: nil)
        user.valid?
        expect(user.errors[:password_confirmation]).to include("doesn't match Password")
      end

      it "パスワードが７文字未満だと登録できない" do
        user = build(:user, password: "000000", password_confirmation: "000000")
        user.valid?
        expect(user.errors[:nickname]).to include("is too long (minimum is 7 characters)")
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
        ['A', '1', '@', 'a', 'あ', 'ア'].each do |value|
          user = build(:user, family_name_kanji: "value")
          user.valid?
          expect(user.errors[:family_name_kanji]).to include("can't be blank")
        end
      end

      it "first_name_kanjiが漢字でなければ登録できない" do
        ['A', '1', '@', 'a', 'あ', 'ア'].each do |value|
          user = build(:user, first_name_kanji: "value")
          user.valid?
          expect(user.errors[:first_name_kanji]).to include("can't be blank")
        end
      end

      it "family_name_kanaが平仮名でなければ登録できない" do
        ['A', '1', '@', 'a', '亜', 'ア'].each do |value|
          user = build(:user, family_name_kana: "value")
          user.valid?
          expect(user.errors[:family_name_kana]).to include("can't be blank")
        end
      end

      it "first_name_kanaが平仮名でなければ登録できない" do
        ['A', '1', '@', 'a', '亜', 'ア'].each do |value|
          user = build(:user, first_name_kana: "value")
          user.valid?
          expect(user.errors[:first_name_kana]).to include("can't be blank")
        end
      end

      it "birthday_yearが空だと登録できない" do
        user = build(:user, birthday_year: nil)
        user.valid?
        expect(user.errors[:birthday_year]).to include("can't be blank")
      end

      it "birthday_monthが空だと登録できない" do
        user = build(:user, birthday_month: nil)
        user.valid?
        expect(user.errors[:birthday_month]).to include("can't be blank")
      end

      it "birthday_dayが空だと登録できない" do
        user = build(:user, birthday_day: nil)
        user.valid?
        expect(user.errors[:birthday_day]).to include("can't be blank")
      end
    end
  end
end

