$(function(){
	$('#slides').slides({
		preload: true,
    pagination: true,
    generatePagination: false,
    play: 5000,
    pause: 2500,
    hoverPause: true
  });
});
$(function(){
	$('#slides2').slides({
		preload: true,
    pagination: true,
    generatePagination: false,
    play: 5000,
    pause: 2500,
    hoverPause: true
  });
});


$(function(){
  $('#running_line').crawlLine({
    speed:2,
    crawElement:'div', // для примера div.move
    textElement:'p',
    hoverClass:'viewText'
  });
});
