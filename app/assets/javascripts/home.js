$(document).on('turbolinks:load', function() {
  var links = $("#main-menu a").click(function(){
    links.removeClass('nav-active');
    $(this).addClass('nav-active');
  });
});
