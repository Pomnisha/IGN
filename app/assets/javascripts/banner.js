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

      
$(document).ready(function() {

var textStrLength = $('#mvDivP').width();
var startPoint = $('#running_line').width();

function crawlline () {
  $('#mvDiv').css({left: startPoint + 1})
	$('#mvDiv').animate({
		left: 0 - textStrLength
	},  (startPoint + 2 * textStrLength) * 10, 'linear', function () { 
		crawlline();
	}
	)};
	
crawlline();
	
	$('#mvDiv').hover(
		function () {
			$(this).stop();
		},
		function () {
			crawlline();
		} 
	)
	
});