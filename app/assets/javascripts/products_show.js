$(function(){
  $(".sub_image").on('mouseover touchend',function(){
    let src_click = $(this).attr('src')
    $('.main_image').attr('src', src_click,)
  });
});