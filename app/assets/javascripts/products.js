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
});

