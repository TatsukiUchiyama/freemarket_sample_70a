$(function(){
  function pulldown_category(category){
    let html = `<div class="pulldown_category">
                  <a href = "#">
                    <div class="pulldown_category__text">${category.name}</div>
                  </a>
                </div>`;
    $(".header__nav_ber__left__category_append").append(html);
  }
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

  $('#category').hover(function(){
    $.ajax({
      url: '/products',
      type: 'GET',
      dataType: 'json'
    })
    .done(function(categories){
      if (categories.length !== 0){
        categories.forEach(function(category){
          pulldown_category(category);
        });
      } else if (input.length == 0) {
        return false;
      }
    });
  }, 
    function() {
    $(".header__nav_ber__left__category_append").empty();
    });
  $('#brand').hover(function(){
    pulldown_brand();
  },
  function() {
    $(".header__nav_ber__left__brand_append").empty();
  });
});
