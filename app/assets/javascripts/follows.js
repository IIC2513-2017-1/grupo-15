// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
$(document).on('turbolinks:load', function() {
  $("button").click(function(){
      $("div").css("background-color", "blue");
  });
});
