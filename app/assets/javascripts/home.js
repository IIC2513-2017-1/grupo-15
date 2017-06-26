$(document).on('turbolinks:load', function() {
  var links = $("#main-menu a").click(function(){
    links.removeClass('nav-active');
    $(this).addClass('nav-active');
  });


  $(".category-item").click(function(){
    $(".selected").removeClass("selected");
    $(this).toggleClass("selected");
    link = $(this).children(".category-link")
  });

  $(".category-link").each(function(){
    $(this).on('ajax:success', function (e, data) {
      $(".project-card-title").html(data.name);
      $(".project-card-owner").html("by "+data.owner);
      $(".project-card-description").html(data.description);
      var filler = $(".project-card-container").find(".filler").first();
      var bar = $(".project-card-container").find(".progress-bar").first();
      filler.data("rate", data.rate);
      $(".project-link").attr("href", "/projects/"+data.id)
      $(".preview").html("Highlighted projects: "+$(this).html())
      loadProjectBar(bar);
    }).on('ajax:error', function (e, data) {
      console.log(data);
    });
  });

});
