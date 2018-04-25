<jsp:include page="Header/header.jsp" />

		<div class="row">
			<div class="col-sm-4 col-sm-offset-6">
		  		<div class="login_form pull-right">
		  			<form action="LoginServlet" method="post" onsubmit="return login(this);">
		  				<head1>Sign In</head1>				
		  				<div>
		  					<input type="text" name="username" placeholder="Username" id="username" minlength="4" required/>
		  				</div>
		  				<div>
		  					<input type="password" name="password" placeholder="Password" id="password" minlength="4" required/>
		  				</div>
		  				<div>
		  					<button type="submit" class="btn btn-lg btn-primary" name="login" id="submit_btn">Sign In</button>
		  				</div>
		  				<div>
							<br>
		  					<a href="resetPass.jsp" style="color:black;" class="href_text"">Forget your password?</a>	
		  				</div>
						<br>
		  				<div class="row">
		  					<div class="col-md-8">
		  						<p>Don't have an account?</p>
							</div>
		  					<div class="col-md-4">
		  						<a href="register.jsp" style="text-decoration: none" class="signUp_btn">Sign Up</a>
		  					</div>
		  				</div>
		  			</form>
		  		</div>
    		</div>
	    </div>
	    
<jsp:include page="Footer/footer.jsp" />
