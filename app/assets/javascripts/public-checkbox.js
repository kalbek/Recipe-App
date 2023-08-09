alert("yey")
$(document).ready(function() {
    $(".public-checkbox").on("change", function() {
      $(".recipe-form").submit();
    });
  });  
  