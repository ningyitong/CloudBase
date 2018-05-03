<!-- Modal -->
<div class="modal fade bs-example-modal-sm" id="resetPassModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-sm">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">
                    <span aria-hidden="true">&times;</span>
                    <span class="sr-only">Close</span>
                </button>
                <h4 class="modal-title text-center" id="myModalLabel" style="font-family: Monaco, serif">Reset Password</h4>
            </div>
            <div class="modal-body">
                <form action="ResetPasswordServlet" class="log_form" method="post" onsubmit="return resetPass(this);">
                    <div>
                        <input type="text" class="log_input" name="username" placeholder=" Input your username  *" id="input" required/>
                    </div>

                    <div>
                        <select name="question" class="log_select" id="dropdown_btn">
                            <option value="1">Where were you born?</option>
                            <option value="2">When is your Birthday (ddmmyyyy)?</option>
                            <option value="3">What is your Surname?</option>
                        </select>
                    </div>
                    <div>
                        <input type="text" class="log_input" name="answer" id="resetPass_answer" placeholder=" Answer(within 10 words)  *" required/>
                    </div>

                    <div>
                        <input type="password" class="log_input" name="password" id="resetPass_password" placeholder=" Password  *" required/>
                    </div>

                    <div>
                        <input type="password" class="log_input" name="repassword" id="resetPass_repassword" placeholder=" Confirm Password  *" required/>
                    </div>

                    <div>
                        <button type="submit" class="log_btn" class="btn btn-lg btn-primary" name="resetPassword" id="submit_btn">Reset</button>
                    </div>
                </form>
                <br>
                <div>
                    <a class="log_link" data-dismiss="modal" data-toggle="modal" data-target="#signInModal">
                        <p>I know my password.</p>
                    </a>
                </div>
                <br>
                <div>
                    <a class="log_link" href='mailto:yning6@sheffield.ac.uk?Subject=Forget%20password%20-%20Cloud%20Platform&Body=My username is: <br>My Email address is:'>Email Admin</a>
                </div>
            </div>
            <div class="modal-footer" style="text-align:center">
                <button type="button" class="btn btn-default" id="modalCloseBtn" data-dismiss="modal">Close</button>
            </div>
        </div>
    </div>
</div>