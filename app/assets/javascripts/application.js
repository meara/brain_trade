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

  // $(document).on("ajax:success","a[data-remote=true].categories", function(event, data) {
  //   event.preventDefault;
  //   console.log(data);
  //   console.log(event);
  //   event.stopPropagation();
  //   $(this).after(data);
  //   event.stopPropagation();
  // });

   $(document).on("click", "a[data-remote=true].subjects", function(event) {
      var link = $(this).attr("href")
      var id = link.charAt(link.length - 1)
      console.log(link)
      console.log(id)
      // console.log(event);
      // console.log(data);
      // console.log($(this.id));
      // var id = $('.hide').prop('id');
      // var num = $('.hide').class.substr(5);

      // var hideid = this.id

      // console.log(num);

      // console.log(event);
      // console.log(data);
      // $(this).after(data);

      $('.hide'+ id).toggle('slow');
     // $('.hide[id]:first-child').toggle('slow');
      // console.log("hidden");
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
