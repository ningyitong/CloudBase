<jsp:include page="header/header.jsp" />



<div class="container" style="padding-top:100px; text-align:center">
	<form action="SignupServlet" method="post" id="sign_up_form" enctype="multipart/form-data">
			<h1>Sign Up</h1>
			<%
				int x = (int)Math.floor((Math.random() * 7) + 1);	
			%>
			<div id="profile-container" style="margin:auto;">
   				<image class="img-thumbnail" id="profileImage" src="images/profile_icons/<%=x %>.png" />
			</div>
			<p>* Click image to change profile icon</p>
			<input id="imageUpload" type="file" name="icon">
			<div>
				<input type="hidden" name="icon_default" value="<%=x %>.png">
			</div>
			<div>
				<input type="text" name="username" id="input" minlength="4" maxlength="12" placeholder="Username" required>
			</div>
			<div>
				<input type="password" name="password" id="password" minlength="4" maxlength="12" placeholder="Password" required>
			</div>
			<div>
				<input type="password" name="repassword" id="repassword" minlength="4" maxlength="12" placeholder="Confirm Password" required>
				<span id='message'></span>
			</div>
			<div>
				<input type="email" name="email" id="input" placeholder="university@sheffield.ac.uk" required>			
			</div>
			
			<div>
				<button type="submit"  value="Upload" class="btn btn-lg btn-primary" id="sign_up_submit_btn">Create Account</button>
			</div>
		</form>
		<br>
		Have an account? <a href="login.jsp">Sign In</a> here!
</div>

<jsp:include page="footer/footer.jsp" />
