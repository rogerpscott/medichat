$(function(){

  $(".tab").on("click", function(e){
    e.preventDefault();
    // Change active tab
    $(".tab").removeClass("active");
    $(this).addClass("active");

    // Hide all tab-content (use class="hidden")
    $(".tab-content").addClass("hidden");

    // Show target tab-content (use class="hidden")
    var id = $(this).data("target");
    $(id).removeClass("hidden")
  });

});


