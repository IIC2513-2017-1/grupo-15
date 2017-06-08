// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
$(document).on('turbolinks:load', function() {
  scrollBottom();
  $(".comments textarea").keydown(function(event) {//se envian mensajes apretando enter
    if (event.keyCode == 13) {
      $(this.form).submit();
      return false;
    }
  });

  var largo = $("#bar").width()*$("#fill").data("rate");
  $("#fill").css("width", largo);
});

var scrollBottom = function(){
  var box = $("#comments-list");
  box[0].scrollTop = box[0].scrollHeight;
};
