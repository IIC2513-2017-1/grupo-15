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

  $(".progress-bar").each(function(){
    bar =  $(this);
    filler = $(this).children(".filler");
    var largo = bar.first().width()*filler.data("rate");
    filler.css("width", largo);
  });


  //-------------------------DROPDOWN-------------------------------

  $(".category-click").each(function(){
    $(this).click(function(e){
      $("#dropdown-text").html($(this).html());
      $("#explore-dropdown").toggleClass("block");
    })
  });

  //-------------------------MOOAL--------------------------------

  // Get the modal
  var modal = $('#modalWindow');
  // Get the button that opens the modal
  var btns = $(".modal-btn");
  // Get the <span> element that closes the modal
  var span = $(".close").first();
  // When the user clicks the button, open the modal
  btns.each(function(index) {
    $(this).on("click", function(){
      modal.css("display" , "block");
      $("#pledge_reward_id").val($(this).data("reward-id"));
    });
  });

  // When the user clicks on <span> (x), close the modal
  span.click(function() {
    modal.css("display" , "none");
  });

  // When the user clicks anywhere outside of the modal, close it
  $(window).click (function(event) {
      if (event.target == modal[0]) {
          modal.css("display" , "none");
      }
  });
});

var loadProjectBar = function(bar){
    filler = bar.children(".filler");
    var largo = bar.first().width()*filler.data("rate");
    filler.css("width", largo);
};

var scrollBottom = function(){
  if ($(".comments").length > 0){
    var box = $("#comments-list");
    box[0].scrollTop = box[0].scrollHeight;
  }
};
