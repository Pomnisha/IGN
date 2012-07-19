var color_to_return = "#004C77"
var text_color_to_return = "#FFFFFF"
$(document).ready(function(){
  $('ul#left_menu_body li').hover(
    function() {
      color_to_return = $(this).css("background-color")
      text_color_to_return = $(this).css("color")
      $(this).css("background-color", "#B82B2B")
      $(this).find("a").css("color", "#FFFFFF")
      $(this).addClass("subhover");
      $(this).find('ul').stop(true, true);
      $(this).find('ul').show();
    },
    function() {
      $(this).removeClass("subhover");
      $(this).css("background-color", color_to_return)
      $(this).find("a").css("color", text_color_to_return)
      $(this).find('ul').hide();
      color_to_return = "#004C77"
      text_color_to_return = "#FFFFFF"
    }
  );
});