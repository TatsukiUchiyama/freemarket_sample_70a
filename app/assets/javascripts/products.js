$(function(){

  // 画像追加ボタンの表示非表示
  if($(".preview").length == 5){
    $("#add_image").hide();
  } 

  // 画像用のinputを生成する関数
  const buildFileField = (index)=> {
    const html = `<div data-index="${index}" class="js-file_group">
                    <input class="js-file" type="file"name="product[images_attributes][${index}][image]" id="product_images_attributes_${index}_src">
                    <span class="js-remove" data-index="${index}">削除（${index}）</span>
                  </div>`;
    return html;
  }

  // file_fieldのnameに動的なindexをつける為の配列
  let fileIndex = [1,2,3,4,5,6,7,8,9,10];

  // 最後のファイル選択ボタンのindex
  lastIndex = $('.js-file_group:last').data('index');
  // 最後のファイル選択ボタンのindexを除外（既に使われているindexを除外）
  fileIndex.splice(0, lastIndex);
  // 削除用セレクトボックスを非表示
  $('.hidden-destroy').hide();

  // プレビュー用のimgタグとダミーの削除ボタンを生成する関数
  const buildImg = (index, url)=> {
    const html = `<div class='preview'>
                    <img data-index="${index}" src="${url}" width="100px" height="100px">
                    <span class='preview__remove' data-index="${index}" >削除</span>
                  </div>`;
    return html;
  }

  // プレビュー画像を追加する処理（ファイルが選択されたら実行）
  $('#image-box').on('change', '.js-file', function(e) {
    // 対象の画像indexを取得
    const targetIndex = $(this).parent().data('index');
    // ファイルのブラウザ上でのURLを取得する
    const file = e.target.files[0];
    const blobUrl = window.URL.createObjectURL(file);
    
    if (img = $(`img[data-index="${targetIndex}"]`)[0]) {
      // 該当indexを持つimgタグがある場合（画像を変更する場合）

      // 変更後のurlを設定する
      img.setAttribute('src', blobUrl);

    } else {
      // 該当indexを持つimgタグが存在しない場合（画像を新規追加する場合）

      // 対象のindexと新たな画像urlを元にimgタグを作成、append
      $('#previews').append(buildImg(targetIndex, blobUrl));

      // fileIndexの先頭の数字を使ってinputを作る
      $('#image-box').append(buildFileField(fileIndex[0]));
      fileIndex.shift();
      // 末尾の数に1足した数を追加する
      fileIndex.push(fileIndex[fileIndex.length - 1] + 1)
    }
  });


  // 画像削除処理
  $('#image-box').on('click', '.js-remove', function() {

    // 削除対象の画像index
    const targetIndex = $(this).parent().data('index')

    // 削除対象となる画像用のチェックボックスを取得する
    const hiddenCheck = $(`input[data-index="${targetIndex}"].hidden-destroy`);
    // もしチェックボックスが存在すればチェックを入れる
    if (hiddenCheck) hiddenCheck.prop('checked', true);


    $(this).parent().remove();
    // 画像入力欄が0個にならないようにしておく
    if ($('.js-file').length == 0) $('#image-box').append(buildFileField(fileIndex[0]));

    // プレビュー画像と削除ボタンを削除
    $(`img[data-index="${targetIndex}"]`).parent().remove();

  });


  // ダミーの画像追加ボタンで画像追加（追加処理処理）
  $("#add_image").on("click", function(){

    // ファイル選択ボタンの最後尾（＝追加用）のクリックイベント発火
    $(".js-file:last").click();

    // 5件画像が選択されている場合、追加ボタンを非表示
    if(5 < $(".preview").length){
      $(this).hide()
    }
    
    return false;
  });

  // ダミーの削除ボタンで画像削除（追加処理）
  $('#image-box').on('click', '.preview__remove', function() {

    // 画像のindexを取得
    const index = $(this).data('index');

    // 対象の削除ボタンに対してクリックイベント発火
    $(`.js-remove[data-index="${index}"]`).click();

    // 削除ボタンが非表示の場合は際表示
    if($("#add_image").css('display') != 'block'){
      $("#add_image").show();
    }

    return false;
  })

  




  $('#new_product_form').submit(function(){
    // 出品ボタン押下時にチェック処理を実行する

    // エラーメッセージを初期化
    $(".sell__main__content__file__up__error").text("");
    $(".sell__main__content__form__name--error").text("");
    $(".sell__main__content__form__description--error").text("");
    $(".sell__main__content__form__box__category--error").text("");
    $(".sell__main__content__form__box__condition--error").text("");
    $(".sell__main__content__form__box__group__shipping_payer--error").text("");
    $(".sell__main__content__form__box__group__shipping_from_area--error").text("");
    $(".sell__main__content__form__box__group__shipping_duration--error").text("");
    $(".sell__main__content__form__box__price__top__error").text("");

    // 送信可否フラグ
    let submit_flg = true;
    // スクロール実行済みフラグ
    let scroll_flg = false;

    // 画像の選択
    let img_first = $("#product_images_attributes_0_image").val();
    if(img_first == ""){

      // エラーメッセージ設定
      $(".sell__main__content__file__up__error").text("画像を選択してください");
      
      // 送信可否フラグを設定
      submit_flg = false;

      // エラー位置までスクロール
      if(scroll_flg == false){
        $(".sell__main__content__file")[0].scrollIntoView(true)
        scroll_flg = true
      }
    }

    // 商品名
    let name = $("#product_name").val();
    if(name == ""){
      // エラーメッセージ設定
      $(".sell__main__content__form__name--error").text("入力してください");
      
      // 送信可否フラグを設定
      submit_flg = false;

      // エラー位置までスクロール
      if(scroll_flg == false){
        $(".sell__main__content__form")[0].scrollIntoView(true)
        scroll_flg = true
      }

    }

    // 商品説明
    let description = $("#product_description").val();
    if(description == ""){
      // エラーメッセージ設定
      $(".sell__main__content__form__description--error").text("入力してください");

      // 送信可否フラグを設定
      submit_flg = false;

      // エラー位置までスクロール
      if(scroll_flg == false){
        $(".sell__main__content__form")[0].scrollIntoView(true)
        scroll_flg = true
      }

    }

    // カテゴリー
    if($("#grandchild_category").length == 0 || $("#grandchild_category").val() == "---"){
      // カテゴリー小区分が存在しない場合、もしくはカテゴリー小区分が選択されていない場合、エラー

      // エラーメッセージを設定
      $(".sell__main__content__form__box__category--error").text("選択してください");

      // 送信可否フラグを設定
      submit_flg = false;

      // エラー位置までスクロール
      if(scroll_flg == false){
        $(".sell__main__content__form__box__group")[0].scrollIntoView(true)
        scroll_flg = true
      }
    }

    // 商品の状態
    if($("#product_condition_id").val() == "0"){

      // エラーメッセージを設定
      $(".sell__main__content__form__box__condition--error").text("選択してください");
      
      // 送信可否フラグを設定
      submit_flg = false;

      // エラー位置までスクロール
      if(scroll_flg == false){
        $(".sell__main__content__form__box__group")[0].scrollIntoView(true)
        scroll_flg = true
      }
    }

    // 配送料の負担
    if($("#product_shipping_payer_id").val() == "0"){

      // エラーメッセージを設定
      $(".sell__main__content__form__box__group__shipping_payer--error").text("選択してください");

      // 送信可否フラグを設定
      submit_flg = false;

      // エラー位置までスクロール
      if(scroll_flg == false){
        $(".sell__main__content__form__box__group")[2].scrollIntoView(true)
        scroll_flg = true
      }

    }

    // 配送元の地域
    if($("#product_shipping_from_area_id").val() == "0"){

      // エラーメッセージを設定
      $(".sell__main__content__form__box__group__shipping_from_area--error").text("選択してください");
      
      // 送信可否フラグを設定
      submit_flg = false;

      // エラー位置までスクロール
      if(scroll_flg == false){
        $(".sell__main__content__form__box__group")[2].scrollIntoView(true)
        scroll_flg = true
      }
    }

    // 発送までの日数
    if($("#product_shipping_duration_id").val() == "0"){

      // エラーメッセージを設定
      $(".sell__main__content__form__box__group__shipping_duration--error").text("選択してください");
      
      // 送信可否フラグを設定
      submit_flg = false;

      // エラー位置までスクロール
      if(scroll_flg == false){
        $(".sell__main__content__form__box__group")[2].scrollIntoView(true)
        scroll_flg = true
      }
    }

    // 販売価格
    let price = $("#product_price").val();
    if( price == "" || Number(price) < 300 || 9999999 < Number(price)){

      // エラーメッセージを設定
      $(".sell__main__content__form__box__price__top__error").text("300以上9999999以下で入力してください");
      
      // 送信可否フラグを設定
      submit_flg = false;
    }
    return submit_flg;

    
})




});
