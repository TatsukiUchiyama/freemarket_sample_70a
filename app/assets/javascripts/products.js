$(function(){
  // 画像データをインプットするボタンと削除ボタンを追加する
  const buildFileField = (num)=> {
    const html = `<div data-index="${num}" class="js-file_group">
                    <input class="js-file hidden" type="file"
                    name="product[images_attributes][${num}][src]"
                    id="product_images_attributes_${num}_src"><br>
                    <div data-index="${num}" class="js-remove hidden">削除(${num})</div>
                  </div>`;
    return html;
  }
  // プレビュー用の画像を表示する
  const buildImg = (index, url)=> {
    const html = `<div class="image_box">
                    <img data-index="${index}" src="${url}" width="144px" height="144px">
                    <div class="js_remove__btn" data-index="${index}">削除</div>
                  </div>`;
    return html;
  }

  // 画像に連番をつけるためのメソッド
  let fileIndex = [1,2,3,4,5,6,7,8,9,10];
  // 既に使われた番号を削除し末尾に１１以降の数字を追加
  lastIndex = $('.js-file_group:last').data('index');
  fileIndex.splice(0, lastIndex);

  // 要素を非表示にする
  $('.hidden-destroy').hide();


  // jsファイルの画像が変更された時にメソッドが発火する
  $(document).on('change', '.js-file', function(e) {

    // jsファイルの親要素のインデックス番号を取得
    const targetIndex = $(this).parent().data('index');

    // ファイルのブラウザ上でのURLを取得する
    const file = e.target.files[0];
    const blobUrl = window.URL.createObjectURL(file);


    // もし押されたjsファイル要素に既に画像が入っている場合
    if (img = $(`img[data-index="${targetIndex}"]`)[0]) {

      // 画像を新しく選択したものに更新する
      img.setAttribute('src', blobUrl);

    } else {  // 押されたjsファイル要素に画像が入っていない場合

      // previewsに画像表示要素を追加
      $('.preview').append(buildImg(targetIndex, blobUrl));

      // image-boxに画像データインプットボタンと削除ボタンを追加する
      $('#image-box').append(buildFileField(fileIndex[0]));

      // fileindexの若番号を削除し末尾に１１以降の数字を追加する
      fileIndex.shift();
      fileIndex.push(fileIndex[fileIndex.length - 1] + 1);



      // 5個目の画像が投稿された時画像投稿ボタンを非表示にする
      let count = $('.image_box').length

      if(count >= 5 ){
        $('.label-content').css({
          'display': `none`
        })
      }
    }
  });

  // もし削除ボタンが押された場合
  $('#image-box').on('click', '.js-remove', function() {

    // 押された削除ボタンの親要素のインデックス番号を取得
    const targetIndex = $(this).parent().data('index');

    //↑の番号を含むインプット要素のチェックボックスを取得
    const hiddenCheck = $(`input[data-index="${targetIndex}"].hidden-destroy`);

    // もしチェックボックスが存在すればチェックを入れる
    if (hiddenCheck) hiddenCheck.prop('checked', true);

    // 親要素もろともインプット要素と削除ボタンを取り除く
    $(this).parent().remove();

    // プレビュー表示画像を削除する
    $(`img[data-index="${targetIndex}"]`).parent().remove();

    // 画像入力欄が0個にならないようにしておく
    if ($('.js-file').length == 0) $('#image-box').append(buildFileField(fileIndex[0]));


    // 5個目の画像が削除された時画像投稿ボタンを表示する
    let count = $('.image_box').length

    if(count <= 4 ){
      $('.label-content').css({
        'display': `block`
      })
    }
  });

  // グレーのエリアがクリックされた時最後のフォームに画像を投稿する
  $('#image-box').on('click', '.label-content', function(){
    $('.js-file:last').click();
    return false;
  });

  // 画像したの削除ボタンが押された時隠された削除ボタンを押す
  $(document).on('click', '.js_remove__btn', function(){
    let remove_index = $(this).data('index');
    $(`.js-remove[data-index="${remove_index}"]`).click();
  });



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

