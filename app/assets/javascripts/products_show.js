$(function(){
  $(".sub_image").on('click', function(){
    let src_click = $(this).prop('src')
    $('.main_image').prop('src', src_click,)
  });
});