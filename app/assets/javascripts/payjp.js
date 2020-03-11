document.addEventListener(
  "DOMContentLoaded", e => {
    //id="token_submit"のボタンが存在する場合、下記の処理を実行する
    if (document.getElementById("token_submit") != null) { 

      // 公開鍵の設定
      Payjp.setPublicKey("pk_test_647e9e364c53fd7162520df4");
      
      // id="token_submit"のボタンを取得
      let btn = document.getElementById("token_submit"); 
      
      // ボタンが押下された時に実行される処理
      btn.addEventListener("click", e => { 

        // デフォルトの挙動を抑止
        e.preventDefault();

        // カード情報（入力値）の設定
        let card = {
          number: document.getElementById("card_number").value,
          cvc: document.getElementById("cvc").value,
          exp_month: document.getElementById("exp_month").value,
          exp_year: document.getElementById("exp_year").value
        }; 

        // トークンを作成する
        Payjp.createToken(card, (status, response) => {

          // 成功した場合
          if (status === 200) { 
            //データを自サーバにpostしないように削除（モデルと紐付けされないようにする）
            $("#card_number").removeAttr("name");
            $("#cvc").removeAttr("name");
            $("#exp_month").removeAttr("name");
            $("#exp_year").removeAttr("name"); 

            // フォーム内に隠し項目を追加し、response.id（=トークン）をvalueに設定
              // payjp-tokenをパラメータとして、サーバー側へ送信する
            $("#card_token").append(
              $('<input type="hidden" name="payjp-token">').val(response.id)
            );

            // サブミット処理を実行する
            document.inputForm.submit();

            // 成功アラート
            alert("登録が完了しました"); 
          } else {
            
            // トークン作成が失敗した場合
            alert("カード情報が正しくありません。"); 
          }
        });
      });
    }
  },
  false
);