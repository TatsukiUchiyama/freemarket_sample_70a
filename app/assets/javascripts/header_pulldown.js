$(function(){
  // 親カテゴリをアペンドするメソッド
  function pulldown_category(category){
    let html = `<div class="pulldown_category" data-category-id="${category.id}">
                  <a href = "/categories/${category.id}">
                    <div class="pulldown_category__text" data-category-id="${category.id}">${category.name}</div>
                  </a>
                </div>`;
    $(".header__nav_ber__left__category_append__area").append(html);
  }
  // 子カテゴリをアペンドするメソッド
  function pulldown_category_children(category){
    let html = `<div class="pulldown_category_children" data-category_children-id="${category.id}">
                  <a href = "/categories/${category.id}">
                    <div class="pulldown_category_children__text" data-category_children-id="${category.id}">${category.name}</div>
                  </a>
                </div>`;
    $(".header__nav_ber__left__category_children_append__area").append(html);
  }
  // 孫カテゴリをアペンドするメソッド
  function pulldown_category_grandchildren(category){
    let html = `<div class="pulldown_category_grandchildren">
                  <a href = "/categories/${category.id}">
                    <div class="pulldown_category_grandchildren__text">${category.name}</div>
                  </a>
                </div>`;
    $(".header__nav_ber__left__category_grandchildren_append__area").append(html);
  }
  // ブランドの一覧をアペンドするメソッド
  function pulldown_brand(brands){
    let html = `<div class="pulldown_brand">
                  <div class="pulldown_brand__text">ポルシェ</div>
                </div>

                <div class="pulldown_brand">
                  <div class="pulldown_brand__text">ベンツ</div>
                </div>

                <div class="pulldown_brand">
                  <div class="pulldown_brand__text">ランボルギーニ</div>
                </div>`;
    $(".header__nav_ber__left__brand_append").append(html);
  }
  // カテゴリのリンクにマウスポインタを乗せた時の処理
  $('#category').hover(function(){
    $.ajax({
      url: '/products/category',
      type: 'GET',
      dataType: 'json'
    })
    // 親カテゴリ一覧を表示する
    .done(function(categories){
      $(".header__nav_ber__left__category_append").empty();
      $(".header__nav_ber__left__category_children_append").empty();
      $(".header__nav_ber__left__category_grandchildren_append").empty();
      $(".header__nav_ber__left__category_append").append(`<div class="header__nav_ber__left__category_append__area"></div>`);
      categories.forEach(function(category){
        pulldown_category(category);
      });
    });
  }, 
  // マウスポインタが外れた時に消えるための処理
  function() {
  $(".header__nav_ber__left__category_append").empty();
  $(".header__nav_ber__left__category_children_append").empty();
  $(".header__nav_ber__left__category_grandchildren_append").empty();
  });
  // ブランドのリンクにマウスポインタを乗せた時の処理
  $('#brand').hover(function(){
    $(".header__nav_ber__left__brand_append").empty();
    pulldown_brand();
  },
  // マウスポインタが外れた時の処理
    function() {
      $(".header__nav_ber__left__brand_append").empty();
    }
  );
  // 追加表示されたカテゴリの各リンクにマウスポインタが乗った時の処理
  $(document).on("mouseover", ".pulldown_category", function() {
    const categoryId = $(this).attr("data-category-id")
    $.ajax({
      url: '/products/category_children',
      type: 'GET',
      data: { id: categoryId },
      dataType: 'json'
    })
    // 子カテゴリ一覧を表示する
    .done(function(category_children){ 
      $(".header__nav_ber__left__category_children_append").empty();
      $(".header__nav_ber__left__category_grandchildren_append").empty();
      $(".header__nav_ber__left__category_children_append").append(`<div class="header__nav_ber__left__category_children_append__area"></div>`);
      category_children.forEach(function(category_child){
        pulldown_category_children(category_child);
      });
    });
  });
  // 子カテゴリの要素にマウスポインタが乗った時の処理
  $(document).on("mouseover", ".pulldown_category_children", function() {
    const categoryId = $(this).attr("data-category_children-id")
    $.ajax({
      url: '/products/category_grandchildren',
      type: 'GET',
      data: { id: categoryId },
      dataType: 'json'
    })
    // 孫カテゴリ一覧を表示する
    .done(function(category_grandchildren){ 
      $(".header__nav_ber__left__category_grandchildren_append").empty();
      $(".header__nav_ber__left__category_grandchildren_append").append(`<div class="header__nav_ber__left__category_grandchildren_append__area"></div>`);
      category_grandchildren.forEach(function(category_grandchild){
        pulldown_category_grandchildren(category_grandchild);
      });
    })
    .fail(function(category_grandchildren){
      alert('通信エラーです。');
    });
  });
});
