<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import ="javax.sql.*" %>

<jsp:include page="header/header.jsp" />
	<div id="carousel-example-generic" class="carousel slide" data-ride="carousel" style="margin:auto;padding-top:50px;">
		<!-- Indicators -->
		<ol class="carousel-indicators">
			<li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
			<li data-target="#carousel-example-generic" data-slide-to="1"></li>
			<li data-target="#carousel-example-generic" data-slide-to="2"></li>
		</ol>
		<!-- Wrapper for slides -->
		<div class="carousel-inner" role="listbox">
			<div class="item active center">
				<img src="images/homeimage1.jpg" alt="Image 1">
				<div class="carousel-caption" style="padding-top:30px">
					<a target="_blank" href="https://drive.google.com/file/d/0B69B3zxG9A6WTi1wYzFnR3I5LTg/view?usp=sharing" id="download_link">Download Plugin</a>
				</div>
			</div>
			<div class="item">
				<img src="images/homeimage2.png" alt="Image 2">
			</div>
			<div class="item">
				<img src="images/homeimage3.jpg" alt="Image 3">
			</div>
		</div>
		<!-- Controls -->
		<a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
			<span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
			<span class="sr-only">Previous</span>
		</a>
		<a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
			<span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
			<span class="sr-only">Next</span>
		</a>
	</div>

    <div class="container" id="dashboard">
    	<div class="col-xs-6">
    		<div style="text-align:center">
    		    <h2>Achievements</h2>
    		</div>
			<ul style="margin-top:30px;padding-left:0px;" class="no_bullets">
		
				<li id="category_list">
					<hr>
					<img src="images/category_icon/3.png" alt="" id="category_icon">
					<a tabindex="0" class="btn btn-lg btn-default" role="button" id="category_popover" data-toggle="popover" data-trigger="focus" data-content="This is for how many cases failed.">Failures</a>
					<%
						try (
							// Step 1: Allocate a database 'Connection' object
 							java.sql.Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/UNeedTesting?useSSL=false", "root", "0908");
/*  							java.sql.Connection conn = DriverManager.getConnection("jdbc:mysql://sql8.freemysqlhosting.net/sql8192358?useSSL=false", "sql8192358", "GtgvAu9xmt");
 */							Statement stmt = conn.createStatement();
						) {
							String strSelect = "select * from achievement where categoryId = 3";
							ResultSet rset = stmt.executeQuery(strSelect);
		
							while(rset.next()) {   // Move the cursor to the next row
					%>	
						<hr style="width:92%;margin-right:0px;">
						<ul class="no_bullets">
							<li>
								<div class="row">
									<div class="col-xs-2">
										<img src="images/category/failure.png" alt="" id="achievement_list_icon">	
									</div>
									<div class="col-xs-10">
										<p><strong><%=rset.getString("event")%></strong> (<%=rset.getString("points")%> points)</p>
										<p><%=rset.getString("description")%></p>
									</div>
								</div>
							</li>
						</ul>
					<%
						}
						} catch(Exception ex) {
							ex.printStackTrace();
					}
					%>
				</li>
				
				<li id="category_list">
					<hr>
					<img src="images/category_icon/4.png" alt="" id="category_icon">
					<a tabindex="0" class="btn btn-lg btn-default" role="button" id="category_popover" data-toggle="popover" data-trigger="focus" data-content="This is for how many testing user has done.">Hard Work</a>
					<%
						try (
							// Step 1: Allocate a database 'Connection' object
 							java.sql.Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/UNeedTesting?useSSL=false", "root", "0908");
/*  							java.sql.Connection conn = DriverManager.getConnection("jdbc:mysql://sql8.freemysqlhosting.net/sql8192358?useSSL=false", "sql8192358", "GtgvAu9xmt");	
 */							Statement stmt = conn.createStatement();
						) {
							String strSelect = "select * from achievement where categoryId = 4";
							ResultSet rset = stmt.executeQuery(strSelect);
		
							while(rset.next()) {   // Move the cursor to the next row
					%>	
						<hr style="width:92%;margin-right:0px;">
						<ul class="no_bullets">
							<li>
								<div class="row">
									<div class="col-xs-2">
										<img src="images/category/hardwork.png" alt="" id="achievement_list_icon">	
									</div>
									<div class="col-xs-10">
										<p><strong><%=rset.getString("event")%></strong> (<%=rset.getString("points")%> points)</p>
										<p><%=rset.getString("description")%></p>
									</div>
								</div>
							</li>
						</ul>
					<%
						}
						} catch(Exception ex) {
							ex.printStackTrace();
					}
					%>
				</li>
				
				<li id="category_list">
					<hr>
					<img src="images/category_icon/6.png" alt="" id="category_icon">
					<a tabindex="0" class="btn btn-lg btn-default" role="button" id="category_popover" data-toggle="popover" data-trigger="focus" data-content="I love testing!">I Love Testing</a>
					<%
						try (
							// Step 1: Allocate a database 'Connection' object
 							java.sql.Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/UNeedTesting?useSSL=false", "root", "0908");
/*  							java.sql.Connection conn = DriverManager.getConnection("jdbc:mysql://sql8.freemysqlhosting.net/sql8192358?useSSL=false", "sql8192358", "GtgvAu9xmt");
 */							Statement stmt = conn.createStatement();
						) {
							String strSelect = "select * from achievement where categoryId = 6";
							ResultSet rset = stmt.executeQuery(strSelect);
		
							while(rset.next()) {   // Move the cursor to the next row
					%>	
						<hr style="width:92%;margin-right:0px;">
						<ul class="no_bullets">
							<li>
								<div class="row">
									<div class="col-xs-2">
										<img src="images/category/i_love_testing.png" alt="" id="achievement_list_icon">	
									</div>
									<div class="col-xs-10">
										<p><strong><%=rset.getString("event")%></strong> (<%=rset.getString("points")%> points)</p>
										<p><%=rset.getString("description")%></p>
									</div>
								</div>
							</li>
						</ul>
					<%
						}
						} catch(Exception ex) {
							ex.printStackTrace();
					}
					%>
				</li>

				<li id="category_list">
					<hr>
					<img src="images/category_icon/8.png" alt="" id="category_icon">
					<a tabindex="0" class="btn btn-lg btn-default" role="button" id="category_popover" data-toggle="popover" data-trigger="focus" data-content="For how fast finishing one test suite.">Speed</a>
					<%
						try (
							// Step 1: Allocate a database 'Connection' object
							java.sql.Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/UNeedTesting?useSSL=false", "root", "0908");
/* 							java.sql.Connection conn = DriverManager.getConnection("jdbc:mysql://sql8.freemysqlhosting.net/sql8192358?useSSL=false", "sql8192358", "GtgvAu9xmt");
 */							Statement stmt = conn.createStatement();
						) {
							String strSelect = "select * from achievement where categoryId = 8";
							ResultSet rset = stmt.executeQuery(strSelect);
		
							while(rset.next()) {   // Move the cursor to the next row
					%>	
						<hr style="width:92%;margin-right:0px;">
						<ul class="no_bullets">
							<li>
								<div class="row">
									<div class="col-xs-2">
										<img src="images/category/speed.png" alt="" id="achievement_list_icon">	
									</div>
									<div class="col-xs-10">
										<p><strong><%=rset.getString("event")%></strong> (<%=rset.getString("points")%> points)</p>
										<p><%=rset.getString("description")%></p>
									</div>
								</div>
							</li>
						</ul>
					<%
						}
						} catch(Exception ex) {
							ex.printStackTrace();
					}
					%>
				</li>
				
				<li id="category_list">
					<hr>
					<img src="images/category_icon/9.png" alt="" id="category_icon">
					<a tabindex="0" class="btn btn-lg btn-default" role="button" id="category_popover" data-toggle="popover" data-trigger="focus" data-content="For the quality of testing code.">Quality</a>
					<%
						try (
							// Step 1: Allocate a database 'Connection' object
 							java.sql.Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/UNeedTesting?useSSL=false", "root", "0908");
/* 							java.sql.Connection conn = DriverManager.getConnection("jdbc:mysql://sql8.freemysqlhosting.net/sql8192358?useSSL=false", "sql8192358", "GtgvAu9xmt");
 */							Statement stmt = conn.createStatement();
						) {
							String strSelect = "select * from achievement where categoryId = 9";
							ResultSet rset = stmt.executeQuery(strSelect);
		
							while(rset.next()) {   // Move the cursor to the next row
					%>	
						<hr style="width:92%;margin-right:0px;">
						<ul class="no_bullets">
							<li>
								<div class="row">
									<div class="col-xs-2">
										<img src="images/category/testing_quality.png" alt="" id="achievement_list_icon">	
									</div>
									<div class="col-xs-10">
										<p><strong><%=rset.getString("event")%></strong> (<%=rset.getString("points")%> points)</p>
										<p><%=rset.getString("description")%></p>
									</div>
								</div>
							</li>
						</ul>
					<%
						}
						} catch(Exception ex) {
							ex.printStackTrace();
					}
					%>
				</li>
			</ul>
    	</div>
  
    	
    	<div class="col-xs-5" id="leaderboarder_container">
    		<h2>Leaderboard</h2>
    		<img src="images/leaderboard/gold.png" id="leaderboard_icon_gold" class="leaderboard_icon">
    		<img src="images/leaderboard/silver.png" id="leaderboard_icon_silver" class="leaderboard_icon">
    		<img src="images/leaderboard/bronze.png" id="leaderboard_icon_bronze" class="leaderboard_icon">
			<%
				try (
					// Step 1: Allocate a database 'Connection' object
 					java.sql.Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/UNeedTesting?useSSL=false", "root", "0908");
/* 					java.sql.Connection conn = DriverManager.getConnection("jdbc:mysql://sql8.freemysqlhosting.net/sql8192358?useSSL=false", "sql8192358", "GtgvAu9xmt");
 */					Statement stmt = conn.createStatement();
				) {
					String strSelect = "select * from users order by points DESC limit 15";
					String username = "";
					String icon = "";
					int points = 0;
					ResultSet rset = stmt.executeQuery(strSelect);
					while(rset.next()) {   // Move the cursor to the next row
						username = (String) rset.getString("username");
						icon = (String) rset.getString("icon");
						points = (int) rset.getInt("points");
			%>	
			<div class="col-xs-4" style="margin-top:30px">
				<img src="<%=icon %>" alt="" class="img-thumbnail" id="user_icon" >				
				<label id="userInfo"><%=username %></label> <br>
				<label id="userInfo">POINTS: <%=points %></label> <br>
				<div style="text-align:center">
					<button id="showUserDetails" class="btn btn-primary" data-username="<%=rset.getString("username")%>" data-points="<%=rset.getInt("points")%>" data-icon="<%=rset.getString("icon") %>"
						        data-toggle="modal" data-target="#myModal">More Info</button>
				</div>
			</div>

			<%
				}
				} catch(Exception ex) {
					ex.printStackTrace();
			}
			%>
		</div>
		
		<!-- Modal -->
		<div class="modal fade bs-example-modal-sm" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog modal-sm">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">
							<span aria-hidden="true">&times;</span>
							<span class="sr-only">Close</span>
						</button>
						<h4 class="modal-title text-center" id="myModalLabel">User Details</h4>
					</div>
					<div class="modal-body">
						<p class="username"></p>
						<p class="points"></p>
					</div>
					<div class="modal-footer" style="text-align:center;">
						<button type="button" class="btn btn-default" id="modalCloseBtn" data-dismiss="modal">Close</button>
					</div>
		    	</div>
		  	</div>
		</div>	
    </div>
    
<jsp:include page="footer/footer.jsp" />
