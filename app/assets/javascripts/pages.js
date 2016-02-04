function uncheck_other_buttons(btn) {
	btn_class = $(btn).attr("class");
	$("."+btn_class).each( function() {
		if (this != btn) {
			this.checked = false;
		}
	});
}

$(function() {
	$("#menu_btn").click( function() {
		$("nav").slideToggle(200);
	});

	$(window).on("resize", function () {
		if ($(window).width() > 750) {
			$("nav").show();
		}
	});
});
