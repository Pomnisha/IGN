$(document).ready(function(){

	$('.lightbox_R').click(function(){
		$('.backdrop_R, .box_R').animate({'opacity':'.50'}, 300, 'linear');
		$('.box_R').animate({'opacity':'1.00'}, 300, 'linear');
		$('.backdrop_R, .box_R').css('display', 'block');
	});

	$('.close_R').click(function(){
		close_box();
	});

	$('.backdrop_R').click(function(){
		close_box();
	});

});

function close_box()
{
	$('.backdrop_R, .box_R').animate({'opacity':'0'}, 300, 'linear', function(){
		$('.backdrop_R, .box_R').css('display', 'none');
	});
}

$(document).ready(function(){

	$('.lightbox_S').click(function(){
		$('.backdrop_S, .box_S').animate({'opacity':'.50'}, 300, 'linear');
		$('.box_S').animate({'opacity':'1.00'}, 300, 'linear');
		$('.backdrop_S, .box_S').css('display', 'block');
	});

	$('.close_S').click(function(){
		close_box();
	});

	$('.backdrop_S').click(function(){
		close_box();
	});

});

function close_box()
{
	$('.backdrop_S, .box_S').animate({'opacity':'0'}, 300, 'linear', function(){
		$('.backdrop_S, .box_S').css('display', 'none');
	});
}


$(document).ready(function(){
  var options1= { 
  	target: "#reg_f",
    success: showResponse1,
    timeout: 3000
  };
  
  var options2= { 
  	target: "#log_f",
    success: showResponse2,
    timeout: 3000
  };
  $('#reg_f').submit(function() { 
    $(this).ajaxSubmit(options1); 
    return false;
  }); 
  
  $('#log_f').submit(function() { 
    $(this).ajaxSubmit(options2); 
    return false;
  }); 
});

function showResponse1(responseText, statusText)  { 
	$('#reg_f').html(responseText);
}
function showResponse2(responseText, statusText)  { 
	$('#log_f').html(responseText);
}
