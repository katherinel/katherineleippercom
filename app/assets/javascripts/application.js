// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .

$(function() {
	$("header h1").text( $("header h1").text().toUpperCase() );
	$("header h2").text( $("header h2").text().toUpperCase() );
	$("header h1").html( $("header h1").text().replace(" ", " <span class=\"logo\"></span> ") );

	$("#menu_btn").click( function() {
		$("nav").slideToggle(200);
	});

	$(window).on("resize", function () {
		if ($(window).width() > 750) {
			$("nav").show();
		}
	});
});