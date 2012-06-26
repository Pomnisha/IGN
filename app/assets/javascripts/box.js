$(document).ready(function(){

	$('.lightbox_R').click(function(){
		$('.backdrop_R, .box_R').animate({'opacity':'.50'}, 300, 'linear');
		$('.box_R').animate({'opacity':'1.00'}, 300, 'linear');
		$('.backdrop_R, .box_R').css('display', 'block');
	});

	$('.close_R').click(function(){
		close_box_R();
	});

	$('.backdrop_R').click(function(){
		close_box_R();
	});

	$('.lightbox_S').click(function(){
		$('.backdrop_S, .box_S').animate({'opacity':'.50'}, 300, 'linear');
		$('.box_S').animate({'opacity':'1.00'}, 300, 'linear');
		$('.backdrop_S, .box_S').css('display', 'block');
	});

	$('.close_S').click(function(){
		close_box_S();
	});

	$('.backdrop_S').click(function(){
		close_box_S();
	});
  
});

function close_box_R()
{
		$('.backdrop_R, .box_R').animate({'opacity':'0'}, 300, 'linear');
		$('.box_R').animate({'opacity':'0'}, 300, 'linear');
		$('.backdrop_R, .box_R').css('display', 'none');
}


function close_box_S()
{
		$('.backdrop_S, .box_S').animate({'opacity':'0'}, 300, 'linear');
		$('.box_S').animate({'opacity':'0'}, 300, 'linear');
		$('.backdrop_S, .box_S').css('display', 'none');
}


$(document).ready(function(){
    $('#log_iframe').load(function(){
      w = $(this).contents().find('body').width();
      h = $(this).contents().find('body').height();
      alert(w); alert(h);
      $('.box_S').animate({'width': w}, 150, 'linear');
      $('.box_S').animate({'height': h}, 150, 'linear');
    });
});

$(document).ready(function(){
    $('#reg_iframe').load(function(){
      w = $(this).contents().find('body').width();
      h = $(this).contents().find('body').height();
      alert(w); alert(h);
      $('.box_R').animate({'width': w}, 150, 'linear');
      $('.box_R').animate({'height': h}, 150, 'linear');
    });
});

