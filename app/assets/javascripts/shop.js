$(document).ready(function(){

	$('.lightbox_I').click(function(){
    var pagesize = getPageSizeWithScroll();

    $('.backdrop_I').css({'width': pagesize[0]});
    $('.backdrop_I').css({'height': pagesize[1]});
    $('.backdrop_I, .box_I').animate({'opacity':'.50'}, 300, 'linear');
		$('.box_I').animate({'opacity':'1.00'}, 300, 'linear');
		$('.backdrop_I, .box_I').css('display', 'block');
    return false;
	});

	$('.close_I').click(function(){
		close_box_I();
	});

	$('.backdrop_I').click(function(){
		close_box_I();
	});

  
  $('#uploadForm input').change(function(){
    $('#uploadForm').ajaxSubmit({
      beforeSubmit: function(a,f,o) {
        o.dataType = 'json';
      },
      complete: function(XMLHttpRequest, textStatus) {
   // XMLHttpRequest.responseText will contain the URL of the uploaded image.
   // Put it in an image element you create, or do with it what you will.
   // For example, if you have an image elemtn with id "my_image", then
   //  $('#my_image').attr('src', XMLHttpRequest.responseText);
   // Will set that image tag to display the uploaded image.
  
      }
  
     });
});
  
  
});

function close_box_I()
{
		$('.backdrop_I, .box_I').animate({'opacity':'0'}, 300, 'linear');
		$('.box_I').animate({'opacity':'0'}, 300, 'linear');
		$('.backdrop_I, .box_I').css('display', 'none');
}

function getPageSizeWithScroll()
{
	if( window.innerHeight && window.scrollMaxY ) {  // Firefox 
		pageWidth = document.body.clientWidth + window.scrollMaxX;
		pageHeight = window.innerHeight + window.scrollMaxY;
	} else if( document.body.scrollHeight > document.body.offsetHeight ) { // all but Explorer Mac
		pageWidth = document.body.scrollWidth;
		pageHeight = document.body.scrollHeight;
	} else { // works in Explorer 6 Strict, Mozilla (not FF) and Safari
		pageWidth = document.body.offsetWidth + document.body.offsetLeft;
		pageHeight = document.body.offsetHeight + document.body.offsetTop;
	}
	arrayPageSizeWithScroll = new Array(pageWidth, pageHeight);
	return arrayPageSizeWithScroll;
}
