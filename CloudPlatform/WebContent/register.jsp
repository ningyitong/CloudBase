<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Registration</title>
		<link rel="stylesheet" type="text/css" href="styles/dashboard.css">
		<link rel="stylesheet" type="text/css" href="//fonts.googleapis.com/css?family=Open+Sans" />
		<!-- Bootstrap core CSS -->
		<link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
		<link href="../../dist/css/bootstrap-theme.min.css" rel="stylesheet">
		<link href="../../assets/css/ie10-viewport-bug-workaround.css" rel="stylesheet"> 
		
		<script tyle="text/javascript">
			function registration(form) {
				if (form.username.value == "") {
					alert("Username should not be empty!");
					return false;
				}
				if (form.password.value == "") {
					alert("Password should not be empty!");
					return false;
				}
				if (form.password.value !=form.repassword.value) {
					alert("You should input the same password!");
					return false;
				}
				if (form.email.value == "") {
					alert("Please input your University Email Address");
					return false;
				}
				if (form.answer.value == "") {
					alert("Please input your answer!");
					return false;
				}
			}
			
			//if we allow user upload personal photo
/* 			function change () {
				var photo = document.getElementById("photo");
				var photoImg = document.getElementById("photoImg");
				photoImg.src = photo.value;
			} */
			
		</script>
	</head>
	<body background="images/background_login.jpg"></body>
	
	<body>
	  <div class="row">
		<div class="col-sm-4 col-sm-offset-6">
		  <div class="registration_form pull-right">
			<form action="RegisterServlet" method="post" onsubmit="return registration(this);">
			  <head1>Sign Up</head1>
			  <div>
			    <input type="text" name="username" id="input" placeholder="Username">
			  </div>
			  <div>
			    <input type="password" name="passowrd" id="input" placeholder="Password">
			  </div>
			  <div>
			    <input type="password" name="repassword" id="input" placeholder="Confirm Password">
			  </div>
			  <div>
			    <input type="email" name="email" id="input" placeholder="University Email Address">
			  </div>
			  <select name="question" id="dropdown_btn">
			    <option value="1">Where were you born?</option>
			    <option value="2">Your Birthday (ddmmyyyy)?</option>
			    <option value="3">Your Surname?</option>
			  </select>
			  <div>
			      <input type="text" name="answer" id="input" placeholder="Answer(within 10 words)">
			  </div>
			  <div>
			    <button type="submit" class="btn btn-lg btn-primary" id="submit_btn">Create Account</button>
			  </div>
		  </form>
		  <br>
		
		Have an account? <a href="login.jsp">Sign In</a> here!
		</div>
		</div>
		</div>
	</body>
</html>