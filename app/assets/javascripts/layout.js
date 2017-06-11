$(document).on('turbolinks:load', function() {

  // Close the dropdown menu if the user clicks outside of it
  var btn = $(".dropbtn");
  var dropdown = $("#user-dropdown")
  btn.click(function(e){
    dropdown.toggleClass("show");
  });

  $(window).click (function(event) {
      if (dropdown.css("display")==="block"&&event.target != dropdown[0] && $(event.target).closest(".dropbtn")[0]!==btn[0]) {
        dropdown.toggleClass("show");
      }
  });


});
