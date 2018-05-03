<div>
	<!-- change user name modal -->						
	<form action="AccountServlet" method="post">
		<div class="modal fade bs-example-modal-sm text-center" id="changeUserName" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel">
			<div class="modal-dialog modal-sm" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
						<h4 class="modal-title" id="myModalLabel">Change User Name</h4>
					</div>
					<div class="modal-body">
						<div>
							<input type="text" name="newUsername" id="changeUserInfoInput" minlength="4" maxlength="12" placeholder="New User Name" required/>
						</div>
						<p style="padding-top:30px;font-size:12px;">* You will log out after saving the change.</p>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn pull-left" id="changeUserInfoBtn" data-dismiss="modal">Close</button>
						<button type="submit" class="btn pull-right" id="changeUserInfoBtn">Save New Name</button>
					</div>
				</div>
			</div>
		</div> <!-- modal close -->
	</form>
	
	<!-- change user email modal -->
	<form action="AccountServlet" method="post">
		<div class="modal fade bs-example-modal-sm text-center" id="changeUserEmail" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel">
			<div class="modal-dialog modal-sm" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
						<h4 class="modal-title" id="myModalLabel">Change Email Address</h4>
					</div>
					<div class="modal-body">
						<div>
							<input type="email" name="newEmail" id="changeUserInfoInput" placeholder="New Email" required>
						</div>
						<p style="padding-top:30px;font-size:12px;">* You will log out after saving the change.</p>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn pull-left" id="changeUserInfoBtn" data-dismiss="modal">Close</button>
						<button type="submit" class="btn pull-right" id="changeUserInfoBtn">Save New Email</button>
					</div>
				</div>
			</div>
		</div> <!-- modal close -->
	</form>
	
	<!-- change user password modal -->
	<form action="AccountServlet" method="post">
		<div class="modal fade bs-example-modal-sm text-center" id="changePassword" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel">
			<div class="modal-dialog modal-sm" role="document">
				<div class="modal-content">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
							<h4 class="modal-title" id="myModalLabel">Change User Password</h4>
						</div>
						<div class="modal-body">
							<div>
								<input type="password" name="newPassword" id="newPassword" minlength="4" maxlength="12" placeholder="New Password" required/>
							</div>
							<div>
								<input type="password" name="reNewPassword" id="reNewPassword" minlength="4" maxlength="12" placeholder="Confirm Password" required/>
							</div>
							<span id='message' style="font-size:12px;padding-top:10px"></span>
							<p style="padding-top:30px;font-size:12px;">* You will log out after saving the change.</p>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn pull-left" id="changeUserInfoBtn" data-dismiss="modal">Close</button>
							<button type="submit" class="btn pull-right" id="reSetPasswordBtn">Save New Password</button>
						</div>
					</div>
				</div>
			</div>
		</div> <!-- modal close -->
	</form>
</div>