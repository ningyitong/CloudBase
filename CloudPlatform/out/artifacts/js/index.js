$(function() {
	
	// show category description
	$(document).ready(function(){
	    $('[data-toggle="popover"]').popover({animation: true});   
	});
	
	// user information modal
	$('button#showUserDetails').on('click', function() {
		var username = $(this).data('username');
		var points = $(this).data('points');
		var icon = $(this).data('icon');
		$("#myModal p.username").text("User:  " + username);
		$("#myModal p.points").text("points:  " + points);
		$("#myModal p.icon").text(icon);
	});
	
	// match password
	$('#password, #repassword,#sign_up_submit_btn').on('keyup', function () {
		  if ($('#password').val() == $('#repassword').val()) {
		    $('#message').html('Matching').css('color', 'green');
		    $('#sign_up_submit_btn').prop('disabled', false);
		  } else {
		    $('#message').html('Confirm Password Is Not Matching').css('color', 'red');
		    $('#sign_up_submit_btn').prop('disabled', true);
		  }
	});
	$('#newPassword, #reNewPassword,#reSetPasswordBtn').on('keyup', function () {
		  if ($('#newPassword').val() == $('#reNewPassword').val()) {
		    $('#message').html('Matching').css('color', 'green');
		    $('#reSetPasswordBtn').prop('disabled', false);
		  } else {
		    $('#message').html('Confirm Password Is Not Matching').css('color', 'red');
		    $('#reSetPasswordBtn').prop('disabled', true);
		  }
	});
	
	$("#profileImage").click(function(e) {
	    $("#imageUpload").click();
	});

	function fasterPreview( uploader ) {
	    if ( uploader.files && uploader.files[0] ){
	          $('#profileImage').attr('src', window.URL.createObjectURL(uploader.files[0]) );
	    }
	}

	$("#imageUpload").change(function(){
	    fasterPreview( this );
	});
});



