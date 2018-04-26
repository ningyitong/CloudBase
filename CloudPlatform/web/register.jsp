<!-- Modal -->
<div class="modal fade bs-example-modal-sm" id="signUpModel" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-sm">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">
                    <span aria-hidden="true">&times;</span>
                    <span class="sr-only">Close</span>
                </button>
                <h4 class="modal-title text-center" id="myModalLabel">Sign Up</h4>
            </div>
            <div class="modal-body">
                <form action="RegisterServlet" method="post" onsubmit="return registration(this);">
                    <head1>Sign Up</head1>
                    <div>
                        <input type="text" name="username" id="input_username" placeholder="Username" required>
                    </div>
                    <div>
                        <input type="password" name="passowrd" id="input_password" placeholder="Password" required>
                    </div>
                    <div>
                        <input type="password" name="repassword" id="input_repassword" placeholder="Confirm Password" required>
                    </div>
                    <div>
                        <input type="email" name="email" id="input_email" placeholder="Email Address" required>
                    </div>
                    <select name="question" id="dropdown_btn">
                        <option value="1">Where were you born?</option>
                        <option value="2">Your Birthday (ddmmyyyy)?</option>
                        <option value="3">Your Surname?</option>
                    </select>
                    <div>
                        <input type="text" name="answer" id="input_answer" placeholder="Answer(within 10 words)" required>
                    </div>
                    <div>
                        <button type="submit" class="btn btn-lg btn-primary" id="submit_btn">Create Account</button>
                    </div>
                </form>
                <br>
                Have an account? <a data-dismiss="modal" data-toggle="modal" data-target="#signInModel">Sign In</a> here!
            </div>
            <div class="modal-footer" style="text-align:center;">
                <button type="button" class="btn btn-default" id="modalCloseBtn" data-dismiss="modal">Close</button>
            </div>
        </div>
    </div>
</div>