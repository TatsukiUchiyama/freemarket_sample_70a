$(function(){
  $('#sell_price').on('input', function(){ 
    let data = Number($('#sell_price').val()); 
    let profit = Math.round(data * 0.9)  
    let fee = (data - profit) 
    $('.sell__main__content__form__box__price__fee__right').html("¥ " + fee) 
		$('.sell__main__content__form__box__price__profit__right').html("¥ " + profit)
		$('#price').val(profit)
    if(data < 300) { 
    $('.sell__main__content__form__box__price__profit__right').html('');
    $('.sell__main__content__form__box__price__fee__right').html('');
    }
  })
})
