<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Clourd Platform</title>
		<link rel="stylesheet" type="text/css" href="Styles/login.css">

		<!-- Bootstrap core CSS -->
		<link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
		<!-- Bootstrap theme -->
		<link href="../../dist/css/bootstrap-theme.min.css" rel="stylesheet">
		<!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
		<link href="../../assets/css/ie10-viewport-bug-workaround.css" rel="stylesheet">

		<script src="../../assets/js/ie-emulation-modes-warning.js"></script>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	    <script type="text/javascript" src="js/login.js"></script>

	</head>
	<body>
	<nav class="navbar navbar-custom navbar-fixed-top">
		<div class="container-fluid">
			<!-- Brand and toggle get grouped for better mobile display -->
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
					<span class="sr-only">Toggle navigation</span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				</button>
				<a class="navbar-brand" style="font-size:22px; font-family:Open Sans;font-weight:bold;">Cloud Platform </a>
			</div>

			<!-- Collect the nav links, forms, and other content for toggling -->
			<div class="collapse navbar-collapse navbar-right" id="bs-example-navbar-collapse-1">
				<ul class="px-nav-actions nav navbar-nav">
					<li><a href="#">
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
						<%=session.getAttribute("user")%>!
					</a></li>
					<li><a href="dashboard.jsp"><span class="glyphicon glyphicon-home"></span> Home</a></li>
					<li><a href="account.jsp"><span class="glyphicon glyphicon-user"></span> Account</a></li>
					<li><a id="login" data-toggle="modal" data-target="#signInModel"><span class="glyphicon glyphicon-log-in"></span> Sign In</a></li>
					<li><a href="LogoutServlet" id="logout" onclick="return confirm('Are you sure you want to LOG OUT?')" ><span class="glyphicon glyphicon-log-out"></span> Log Out</a></li>
				</ul>
			</div><!-- /.navbar-collapse -->
		</div>
	</nav>
	<jsp:include page="login.jsp"/>
