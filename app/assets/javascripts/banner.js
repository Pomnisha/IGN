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

if ($("#mvDiv").length > 0){

var textStrLength = $('#mvDivP').width();
var startPoint = $('#running_line').width();

function crawlline () {
  var pos = $('#mvDiv').position().left;
  var duration = (pos + 2 * textStrLength) * 10;

	$('#mvDiv').animate(
    {left: 0 - textStrLength},
    duration,
    'linear', 
    function () { 
      $('#mvDiv').css({left: startPoint + 1})
		  crawlline();
	  }
	)
};
  
    crawlline();
	
	$('#mvDiv').hover(
		function () {
  		$(this).stop();
		},
		function () {
			crawlline();
		} 
	)
  
}	


	
});