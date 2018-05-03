<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Clourd Platform</title>
		<link rel="stylesheet" type="text/css" href="styles/bootstrap.css">
        <link rel="stylesheet" type="text/css" href="styles/dashboard.css">
        <link rel="stylesheet" type="text/css" href="styles/logpage.css">
        <link rel="stylesheet" type="text/css" href="styles/upload.css">

		<!-- Bootstrap core CSS -->
		<link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
		<!-- Bootstrap theme -->
		<link href="../../dist/css/bootstrap-theme.min.css" rel="stylesheet">
		<!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
		<link href="../../assets/css/ie10-viewport-bug-workaround.css" rel="stylesheet">

        <%--Load Java Script--%>
		<script src="../../assets/js/ie-emulation-modes-warning.js"></script>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <script type="text/javascript" src="js/upload.js"></script>
        <script type="text/javascript" src="js/user.js"></script>
        <script type="text/javascript" src="js/dashboard.js"></script>
	</head>
	<body>
	<nav class="navbar navbar-custom navbar-fixed-top" id="nav-bar" style="background: white">
		<div class="container-fluid">
			<!-- Brand and toggle get grouped for better mobile display -->
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
					<span class="sr-only">Toggle navigation</span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				</button>

                <a class="navbar-brand" ><img src="images/logo_platform.png" height="22" width="28"></a>
                <a class="navbar-brand" style="font-size:22px;font-weight:bold;color:black">Chicken Dinner</a>
			</div>

			<!-- Collect the nav links, forms, and other content for toggling -->
			<div class="collapse navbar-collapse navbar-right" id="bs-example-navbar-collapse-1">
				<ul class="px-nav-actions nav navbar-nav">
					<li><a href="#" class="nav-text">
						<script>
                            var curTime = new Date();
                            var curHour = curTime.getHours(0);
                            /* hour is before noon */
                            if ( curHour < 12 ) {
                                document.write("Good Morning, ");
                            } else if ( curHour >= 12 && curHour <= 17 ) {
                                document.write("Good Afternoon, ");
                            } else if ( curHour > 17 && curHour <= 24 ) {
                                document.write("Good Evening, ");
                            } else {
                                document.write("I'm not sure what time it is! ");
                            }
						</script>
						<%=session.getAttribute("username")%>!
					</a></li>
					<li><a href="dashboard.jsp" class="nav-text"><span class="glyphicon glyphicon-home"></span> Home</a></li>
					<li><a href="account.jsp" class="nav-text"><span class="glyphicon glyphicon-user"></span> Account</a></li>
                    <li><a href="upload.jsp" class="nav-text"><span class="glyphicon glyphicon-cloud"></span> Upload</a></li>
                    <li><a href="admin.jsp" id="AdminHidden" class="nav-text"><span class="glyphicon glyphicon-king"></span> Admin</a></li>
					<li><a id="login" data-toggle="modal" data-target="#signInModal" class="nav-text"><span class="glyphicon glyphicon-log-in"></span> Sign In</a></li>
                    <li><a id="signup" data-toggle="modal" data-target="#signUpModal" class="nav-text"><span class="glyphicon glyphicon-log-in"></span> Sign Up</a></li>
					<li><a href="LogoutServlet" id="logout" class="nav-text" onclick="return confirm('Are you sure you want to LOG OUT?')" ><span class="glyphicon glyphicon-log-out"></span> Log Out</a></li>
				</ul>
			</div><!-- /.navbar-collapse -->
            <!-- hidden admin button -->
            <script type="text/javascript">
                var user = '<%=session.getAttribute("user")%>';
                var session_admin = '<%=session.getAttribute("admin")%>';

                if (user != 'null') {
                    $(".px-nav-actions li").eq(5).hide();
                    $(".px-nav-actions li").eq(6).hide();
                    (session_admin>0)?$(".px-nav-actions li").eq(4).show():$(".px-nav-actions li").eq(4).hide();
                } else {
                    $(".px-nav-actions li").eq(0).hide();
                    $(".px-nav-actions li").eq(2).hide();
                    $(".px-nav-actions li").eq(3).hide();
                    $(".px-nav-actions li").eq(4).hide();
                    $(".px-nav-actions li").eq(7).hide();
                    document.getElementById("addApp_col").style.display = 'none';
                }
            </script>
		</div>
	</nav>
	<jsp:include page="login.jsp"/>
    <jsp:include page="register.jsp"/>
    <jsp:include page="resetPass.jsp"/>
    <jsp:include page="uploadModal.jsp"/>
