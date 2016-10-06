// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require bootstrap
//= require bootsy
//= require_tree .

$(document).ready(function() {
    // show the alert
    setTimeout(function() {
        $(".alert").alert('close');
    }, 4000);
$('nav').removeClass('dropback');

    $("#navCol").on("click", function() {
        $('nav').addClass('dropback');
    });


            // hide .navbar first
        $("nav").removeClass('navback');
            // fade in .navbar
        $(function () {
            $(window).scroll(function() {
                
                // set distance
                if ($(this).scrollTop() > 100) {
                    $('nav').addClass('navback');
                } else {
                    $('nav').removeClass('navback');
                }
                });
            });
        
        });