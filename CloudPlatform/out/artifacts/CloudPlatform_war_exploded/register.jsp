<jsp:include page="header.jsp" />
    <div class="row">
		<div class="col-sm-4 col-sm-offset-6">
            <div class="registration_form pull-right">
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
                        <input type="email" name="email" id="input_email" placeholder="University Email Address" required>
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
                Have an account? <a href="login.jsp">Sign In</a> here!
            </div>
        </div>
    </div>
<jsp:include page="footer.jsp" />