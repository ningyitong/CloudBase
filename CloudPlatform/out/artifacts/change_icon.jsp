<jsp:include page="header/header.jsp" />
<div id="fb-root"></div>
<div id="fb-root"></div>

<div class="container" style="padding-top:100px; text-align:center">
	<form action="ChangeIconServlet" method="post" id="sign_up_form" enctype="multipart/form-data">
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
				<button type="submit"  value="Upload" class="btn btn-lg btn-primary" id="sign_up_submit_btn">Change Icon</button>
			</div>
		</form>
		<br>
		<a href="account.jsp">Cancel Change </a>
</div>

<jsp:include page="footer/footer.jsp" />
