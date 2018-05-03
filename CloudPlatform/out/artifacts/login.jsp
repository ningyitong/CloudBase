<jsp:include page="header/header.jsp" />
<div id="fb-root"></div>
<div id="fb-root"></div>
<script>(function(d, s, id) {
  var js, fjs = d.getElementsByTagName(s)[0];
  if (d.getElementById(id)) return;
  js = d.createElement(s); js.id = id;
  js.src = "//connect.facebook.net/en_GB/sdk.js#xfbml=1&version=v2.10";
  fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'facebook-jssdk'));</script>

<div class="container" style="padding-top:100px; text-align:center">
		<div class="login_form">
			<form action="LoginServlet" method="post" onsubmit="return login(this);">
				<h1>Sign In</h1>				
				<div>
					<input type="text" name="username" placeholder="Username" id="username" minlength="4" maxlength="12" required>
				</div>
				<div>
					<input type="password" name="password" placeholder="Password" id="password" minlength="4" maxlength="12" required>
				</div>			
				<div>
					<button type="submit" class="btn btn-lg btn-primary" name="login" id="submit_btn">Sign In</button>
				</div>
			</form>
			<div class="fb-login-button" data-max-rows="1" data-size="large" data-button-type="continue_with" data-show-faces="false" data-auto-logout-link="false" data-use-continue-as="false">
			</div>

			<div>
				<br>
				<a href="#" style="color:black;" class="href_text">Forget your password?</a>	
			</div>
				<br>
			<div>
			<p>OR</p>
				<a href="signUp.jsp" class="btn btn-lg btn-primary" id="submit_btn">Sign Up</a>
			</div>	
		</div>
		<br/>
</div>

<jsp:include page="footer/footer.jsp" />
