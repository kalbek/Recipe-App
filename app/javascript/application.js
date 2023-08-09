// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"

alert("yey")
$(document).ready(function() {
    $(".public-checkbox").on("change", function() {
      $(".recipe-form").submit();
    });
  });  
