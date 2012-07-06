$(document).ready(function(){

	$('.lightbox_R').click(function(){
    var pagesize = getPageSizeWithScroll();
    $('.box_R').css({'left': (pagesize[0] / 2 - 225)});
    $('.box_R').css({'top': (pagesize[1] / 2 - 350)});
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
    var pagesize = getPageSizeWithScroll(); 
    $('.box_S').css({'left': (pagesize[0] / 2 - 225)});
    $('.box_S').css({'top': (pagesize[1] / 2 - 350)});   
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


function changeFrameSize (a, b){
  	var pagesize = getPageSizeWithScroll();
    
    if (a.contents().find('#success').length != 0) {
          window.location = '/';
      } else {
//          w = a.contents().find('body').outerWidth();
//          h = a.contents().find('body').outerHeight();
          w = a.contents().find('header').width();
          h = a.contents().find('header').height() + a.contents().find('#page_container').height();
          a.contents().find('body').css({'background': 'white'});
      
//        $('.box_R').animate({'left': (pagesize[0] / 2 - 225)}, 150, 'linear');
//        $('.box_R').animate({'top': (pagesize[1] / 2 - 350)}, 150, 'linear');          
        
//        b.animate({'width': (pagesize[0] - w - 50) / 2 }, 150, 'linear');
//        b.animate({'height': (pagesize[1] - h - 50) / 2 }, 150, 'linear');        
//        a.css({'width': w + 50, 'height': h + 50});
//        b.animate({'width': w + 50}, 150, 'linear');
//        b.animate({'height': h + 60}, 150, 'linear');      

      }
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

$(document).ready(function(){
    $('#log_iframe').contents().find('body').load(function (){
      changeFrameSize($('#log_iframe'),$('.box_S'))
//      alert("Yes");
    });
    
    $('#log_iframe').load(function(){
      changeFrameSize($(this), $('.box_S'));
//      alert("Yes");
    });

    $('#reg_iframe').contents().find('body').load(function (){
      changeFrameSize($('#log_iframe'),$('.box_S')) 
//      alert("Yes");      
    });

    $('#reg_iframe').load(function(){
      changeFrameSize($(this), $('.box_R'));
//      alert("Yes");
    });

    
    $(window).resize( function() {
        var pagesize = getPageSizeWithScroll(); 
        $('.box_S').css({'left': (pagesize[0] / 2 - 225)});
        $('.box_S').css({'top': (pagesize[1] / 2 - 350)});   
        $('.box_R').css({'left': (pagesize[0] / 2 - 225)});
        $('.box_R').css({'top': (pagesize[1] / 2 - 350)});
    });
    
    
/*    
    var reg_options = { 
    target: '#reg_f', 
    success: showResponseReg   
    }; 
    
    $('#regform').live("submit", function(){
        $(this).ajaxSubmit(reg_options); 
      return false;
    })
    
    var log_options = { 
    target: '#log_f', 
    success: showResponseLog   
    }; 
    
    $('#logform').live("submit", function(){
      $(this).ajaxSubmit(log_options); 
    return false;
    })
    
   $('form#sign_in').live('ajax:success', function(e, data, status, xhr) {
    console.log(data);
    if(data.success) {
      window.location = "/"
    } else {
      $('#user_login_box').prepend(data.errors.join('<br />'));
    }
  });
*/   


});


/*
function showResponseReg(responseText, statusText, xhr, $form)  { 
    if (responseText.indexOf("success") != -1) {window.location = "/"}
    else {
      var reg_options = { 
      target: '#reg_f', 
      success: showResponseReg   
      }; 
    
      $('#regform').live("submit", function(){
        $(this).ajaxSubmit(reg_options); 
      return false;
    })
    }
} 

function showResponseLog(responseText, statusText, xhr, $form)  { 
    if (responseText.indexOf("success") != -1) {window.location = "/"}
    else {
      
      $('#log_f_none').html(responseText);
      $('#log_f').html($('#log').html());
      $('#log_f_none').html("");
      
      
      var log_options = { 
      target: '#log_f', 
      success: showResponseLog   
      }; 
    
      $('#logform').live("submit", function(){
        $(this).ajaxSubmit(log_options); 
      return false;
      })
    }
} */