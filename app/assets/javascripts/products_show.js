$(function(){
  $(".sub_image").on('mouseover touchend', function(){
    let src_click = $(this).prop('src')
    $('.main_image').prop('src', src_click,)
  });
});