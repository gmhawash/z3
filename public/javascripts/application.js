// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
//
$(function() {
  $(".wymeditor").wymeditor();

  $(".category").click(function() {
    $(this).next().fadeToggle(1000);
    });
});

