$(function(){

  // 購入ボタンの活性非活性制御
  if(! $('.new__detail__payment__lists__list__payment-method').length){
    // クレジットカード情報が表示されていない場合

    // 購入ボタンの色を変更
    $('.transaction-new-submit').css('background-color','#888888');

    // 購入ボタンを非活性化
    $('.transaction-new-submit').prop("disabled", true);

  }

})