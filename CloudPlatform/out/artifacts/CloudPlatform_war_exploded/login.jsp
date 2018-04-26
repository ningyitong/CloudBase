<!-- Modal -->
<div class="modal fade bs-example-modal-sm" id="signInModel" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-sm">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">
					<span aria-hidden="true">&times;</span>
					<span class="sr-only">Close</span>
				</button>
				<h4 class="modal-title text-center" id="myModalLabel">Login</h4>
			</div>
			<div class="modal-body">
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
						<a href="resetPass.jsp" style="color:black;" class="href_text">Forget your password?</a>
					</div>
					<br>
					<div class="row">
						<div class="col-md-8">
							<p>Don't have an account?</p>
						</div>
						<div class="col-md-4">
							<a style="text-decoration: none" class="signUp_btn" data-dismiss="modal" data-toggle="modal" data-target="#signUpModel">Sign Up</a>
						</div>
					</div>
				</form>
			</div>
			<div class="modal-footer" style="text-align:center;">
				<button type="button" class="btn btn-default" id="modalCloseBtn" data-dismiss="modal">Close</button>
			</div>
		</div>
	</div>
</div>

<jsp:include page="register.jsp"/>