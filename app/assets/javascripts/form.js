$(document).on('turbolinks:load', function() {
  var height = $("main").height();
  $(".standard-form").css("height", height);

  var width = ($("main").innerWidth()-$(".form").outerWidth(true))/2;
  $(".form").css("right", width);
  $(".form").css("top", 125);


});
