<!-- Modal -->
<div class="modal fade bs-example-modal-sm" id="signUpModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-sm">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">
                    <span aria-hidden="true">&times;</span>
                    <span class="sr-only">Close</span>
                </button>
                <h4 class="modal-title text-center" id="myModalLabel" style="font-family: Monaco, serif">Sign Up</h4>
            </div>
            <div class="modal-body" style="overflow:auto;">
                <form action="RegisterServlet" class="log_form" method="post" onsubmit="return registration(this);">
                    <div>
                        <input type="text" class="log_input" name="username" id="input_username" placeholder=" Username" required>
                    </div>
                    <div>
                        <input type="password" class="log_input" name="password" id="input_password" placeholder=" Password" required>
                    </div>
                    <div>
                        <input type="password" class="log_input" name="repassword" id="input_repassword" placeholder=" Confirm Password" required>
                    </div>
                    <div>
                        <input type="email" class="log_input" name="email" id="input_email" placeholder=" Email Address" required>
                    </div>
                    <select name="question" class="log_select" id="dropdown_btn" style="color: black; background: transparent">
                        <option value="1">Where were you born?</option>
                        <option value="2">When is your Birthday?</option>
                        <option value="3">What is your Surname?</option>
                    </select>
                    <div>
                        <input type="text" class="log_input" name="answer" id="input_answer" placeholder=" Answer(within 10 words)" required>
                    </div>
                    <div>
                        <button type="submit" class="log_btn"  class="btn btn-lg btn-primary" id="submit_btn">Create Account</button>
                    </div>
                </form>
                <br>
                Have an account? <a class="log_link" data-dismiss="modal" data-toggle="modal" data-target="#signInModal">Sign In</a> here!
            </div>
            <div class="modal-footer" style="text-align:center;">
                <button type="button" class="btn btn-default" id="modalCloseBtn" data-dismiss="modal">Close</button>
            </div>
        </div>
    </div>
</div>