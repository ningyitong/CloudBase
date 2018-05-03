<!-- Modal -->
<div class="modal fade bs-example-modal-sm" id="signInModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-sm">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">
					<span aria-hidden="true">&times;</span>
					<span class="sr-only">Close</span>
				</button>
				<h4 class="modal-title text-center" id="myModalLabel" style="font-family: Monaco, serif">Login</h4>
			</div>
			<div class="modal-body">
				<form action="LoginServlet" class="log_form" method="post" onsubmit="return login(this);">
					<div>
						<input type="text" class="log_input" name="username" placeholder=" Username" id="username" minlength="4" required/>
					</div>
					<div>
						<input type="password" class="log_input" name="password" placeholder=" Password" id="password" minlength="4" required/>
					</div>
					<div>
						<button type="submit" class="log_btn" class="btn btn-lg btn-primary" name="login" id="submit_btn">Sign In</button>
					</div>
                    <br>
					<div>
						<a class="log_link" data-dismiss="modal" data-toggle="modal" data-target="#resetPassModal">
                            <p>Forget your password?</p>
                        </a>
					</div>
                    <br>
                    <div>
                        <p style="margin-bottom: -10px">Don't have an account?</p>
                        <button class="log_btn" data-dismiss="modal" data-toggle="modal" data-target="#signUpModal">Sign Up</button>
					</div>
				</form>
			</div>
			<div class="modal-footer" style="text-align:center">
				<button type="button" class="btn btn-default" id="modalCloseBtn" data-dismiss="modal">Close</button>
			</div>
		</div>
	</div>
</div>