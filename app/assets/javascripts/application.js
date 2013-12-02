// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require twitter/bootstrap
//= require turbolinks
//= require_tree .

// AJAX edit button
$(function() {
  $(document).on("ajax:success", ".edit_button a[data-remote=true]", function(event, data) {
    $(".edit_button a[data-remote=true]").replaceWith(data);
  });

// AJAX categories

  // // Upon clicking a category, if there's an ajax request
  $(document).on("ajax:success","a[data-remote=true].categories", function(event, data) {
    $(this).after(data);
  });


  // $(".categories a:first-child").on("click", function(event) {
  //   event.preventDefault();
  //   // console.log(event);
  //   var url = $(this).attr("href");
  //   // console.log(url);
  //   $.get(url, function(response) {
  //     console.log(response);
  //     $(response).appendTo(".categories a:first-child");
  //   });
  // });
});
