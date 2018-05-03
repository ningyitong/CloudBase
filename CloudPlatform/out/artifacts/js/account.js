/**
 * 
 */

$(function() {
	$(document).ready(function(){
	    $('input[name="achievementRadio"]').click(function(){
	        var inputValue = $(this).attr("value");
	        var targetBox = $("." + inputValue);
	        $(".box").not(targetBox).hide();
	        $(targetBox).show();
	    });
	});
});
