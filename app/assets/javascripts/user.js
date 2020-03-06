$(function(){
	$('.tab_upper').click(function(){
		$('.active_upper').removeClass('active_upper');
		$(this).addClass('active_upper');
		$('.show_upper').removeClass('show_upper');
		const index = $(this).index();
		$('.panel_upper').eq(index).addClass('show_upper');
  });
  $('.tab_lower').click(function(){
		$('.active_lower').removeClass('active_lower');
		$(this).addClass('active_lower');
		$('.show_lower').removeClass('show_lower');
		const index = $(this).index();
		$('.panel_lower').eq(index).addClass('show_lower');
	});
});