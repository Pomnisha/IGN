$(document).ready(function(){
  $('ul#left_menu_body li').hover(
    function() {
      $(this).addClass("subhover");
      $(this).find('ul').stop(true, true);
      $(this).find('ul').slideDown();
    },
    function() {
      $(this).removeClass("subhover");
      $(this).find('ul').slideUp('slow');
    }
  );
});