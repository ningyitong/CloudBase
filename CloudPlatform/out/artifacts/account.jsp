<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import ="javax.sql.*" %>

<jsp:include page="header/header.jsp" />
<%
	if (session.getAttribute("user")==null) {
		response.sendRedirect("login.jsp");
	}
%>
	<div class="container" id="accountSettings">
    	<%
			try (
				// Step 1: Allocate a database 'Connection' object
				java.sql.Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/UNeedTesting?useSSL=false", "root", "0908");
/* 				java.sql.Connection conn = DriverManager.getConnection("jdbc:mysql://sql8.freemysqlhosting.net/sql8192358?useSSL=false", "sql8192358", "GtgvAu9xmt");
 */				Statement stmt = conn.createStatement();
			) {
				String username = (String) session.getAttribute("user");
				String strSelect = "select * from users where username = '" + username + "'";
				int level;
				int points;
				int rank;
				String icon = "";
				String email = "";
				String testCaseNum = "";
				ResultSet rset = stmt.executeQuery(strSelect);
				while(rset.next()) {   
					// Move the cursor to the next row
					rank = rset.getInt("rank");
					level = rset.getInt("level");
					points = rset.getInt("points");
					icon = rset.getString("icon");
					email = rset.getString("email");
					testCaseNum = rset.getString("testCaseNum");
		%>	
			
		<div class="row" style="min-width:1000px;margin:auto;">
			<div class="col-xs-2">
				<img src="<%=icon %>" alt="" id="user_icon" class="img-circle">
			</div>
			<div class="col-xs-3">
				<div>
					<Label id="user_info_account" style="font-size:30px"><%=username %></Label>
				</div>
				<div>
					<Label id="user_info_account" style="font-size:15px"><%=email %></Label>
				</div>
			</div>
			<div class="col-xs-2 col-xs-offset-1">
				<div>
					<Label id="user_info_account" style="font-size:15px">RANK</label>
					<br>
					<Label id="user_info_account" style="font-size:15px"><%=rank %></label>
				</div>
			</div>
			<div class="col-xs-2">
				<div>
					<label id="user_info_account" style="font-size:15px">POINTS</label>
					<br>
					<label id="user_info_account" style="font-size:15px"><%=points %></label>
				</div>
			</div>
			<div class="col-xs-2">
				<div>
					<div class="dropdown">
						<button class="btn btn-default dropdown-toggle" type="button" id="dropdownMenu1" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true" style="color:white;border:none;background:none;'">
							<span class="glyphicon glyphicon-cog fa-3x"></span>
						</button>
 						<ul class="dropdown-menu" aria-labelledby="dropdownMenu1">
							<!-- change user name modal -->								
							<li><a data-toggle="modal" data-target="#changeUserName">Edit Name <i class="fa fa-pencil-square-o pull-right" aria-hidden="true"></i></a></li>
							<li role="separator" class="divider"></li>
							<!-- change user email modal -->								
							<li><a data-toggle="modal" data-target="#changeUserEmail">Edit Email <i class="fa fa-envelope-o pull-right" aria-hidden="true"></i></a></li>
							<li role="separator" class="divider"></li>
							<!-- change user password modal -->								
							<li><a data-toggle="modal" data-target="#changePassword">Edit Password <i class="fa fa-key pull-right" aria-hidden="true"></i></a></li>
							<li role="separator" class="divider"></li>
							<!-- change user password modal -->								
							<li><a target="_blank" href="change_icon.jsp">Edit Icon <i class="fa fa-picture-o pull-right" aria-hidden="true"></i></a></li>
						</ul>
					</div>
				</div>
			</div>
			<jsp:include page="form/account_form.jsp" />
		</div>
		
		<%
				}
			} catch(Exception ex) {
				ex.printStackTrace();
			}
		%>
		</div>
    </div>
	<br>
	<div class="container text-left" style="min-width:1000px;">
    	<div class="row text-center radio-toolbar">
    		<div class="col-xs-6">
				<input type="radio" name="achievementRadio" id="achieved" value="achieved" checked>
				<label id="radioBtnLabel" for="achieved"> Achieved</label>
			</div>
	    	<div class="col-xs-6">
				<input type="radio" name="achievementRadio" id="unfinished" value="unfinished">
				<label id="radioBtnLabel" for="unfinished"> Unfinished</label>
	    	</div>
		</div>
	</div>
	<br>
	<div class="container" id="achievementView">
		<div class="achieved box">
			<%
				try (
					// Step 1: Allocate a database 'Connection' object
 					java.sql.Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/UNeedTesting?useSSL=false", "root", "0908");
/* 					java.sql.Connection conn = DriverManager.getConnection("jdbc:mysql://sql8.freemysqlhosting.net/sql8192358?useSSL=false", "sql8192358", "GtgvAu9xmt");
 */					Statement stmt = conn.createStatement();
				) {
					String username = (String)session.getAttribute("user");
					String strSelect = "select * from userLine left join achievement on userLine.event=achievement.event where stage != 0 and username = '" + username + "' order by stage DESC";
					String event = "";
					String description = "";
					int points;
					int stage;
					int categoryId;
					int totalNum;
					int curNum;
					int process;
					ResultSet rset = stmt.executeQuery(strSelect);
	
					while(rset.next()) {
						points = rset.getInt("points");
						categoryId = rset.getInt("categoryId");
						event = (String) rset.getString("event");
						curNum = rset.getInt("count");
						stage = rset.getInt("stage");
						description = rset.getString("description");
						totalNum = rset.getInt("con");
						process = (int)curNum*100/totalNum;
			%>	
			<ul style="margin-top:10px;padding-left:0px;" class="no_bullets">
				<div class="row">
					<div class="col-xs-1">
						<img src="images/category_icon/<%=categoryId %>.png" alt="" id="account_icon">	
					</div>
					<div class="col-xs-5">
						<ul style="margin-top:10px;padding-left:0px;" class="no_bullets">
							<li>
								<b><%=event %></b> (<%=points %> points)
							</li>
							<li>
								<%=description %>
							</li>
						</ul>
					</div>
					<div class="col-xs-5">
						<div class="progress">
	  						<div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="<%=curNum %>" aria-valuemin="0" aria-valuemax="<%=totalNum %>" style="width: <%=process %>%;"><%=curNum %>/<%=totalNum %></div>
						</div>
					</div>
					<div class="col-xs-1">
						<img src="images/achievement_event/<%=stage %>.png" alt="" id="account_icon">	
					</div>
				</div>
				<hr>
			</ul>
			<%
					}
				} catch(Exception ex) {
					ex.printStackTrace();
				}
			%>
		</div>
		
		<div class="unfinished box" hidden>
			<%
				try (
					// Step 1: Allocate a database 'Connection' object
 					java.sql.Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/UNeedTesting?useSSL=false", "root", "0908");
/*  					java.sql.Connection conn = DriverManager.getConnection("jdbc:mysql://sql8.freemysqlhosting.net/sql8192358?useSSL=false", "sql8192358", "GtgvAu9xmt");
 */					Statement stmt = conn.createStatement();
				) {
					String username = (String) session.getAttribute("user");
					String strSelect = "select * from userLine left join achievement on userLine.event=achievement.event where stage = '0' and username = '" + username + "' and achievement.categoryId != 5";
					String event = "";
					String description = "";
					int points;
					int categoryId;
					int totalNum;
					int curNum;
					int process;
	
					ResultSet rset = stmt.executeQuery(strSelect);
	
					while(rset.next()) {   // Move the cursor to the next row
						event = rset.getString("event");
						curNum = rset.getInt("count");
						totalNum = rset.getInt("con");
						process = curNum*100/totalNum;
						categoryId = rset.getInt("categoryId");
						description = rset.getString("description");
						points = rset.getInt("points");
			%>	
	
			<ul style="margin-top:10px;padding-left:0px;" class="no_bullets">
				<div class="row">
					<div class="col-xs-1">
						<img src="images/category_icon/<%=categoryId %>.png" alt="" id="account_icon">	
					</div>
					<div class="col-xs-5">
						<ul style="margin-top:10px;padding-left:0px;" class="no_bullets">
							<li>
								<b><%=event %></b> (<%=points %> points)	
							</li>
							<li>
								<%=description %>
							</li>
						</ul>
					</div>
					<div class="col-xs-5">
						<div class="progress" id="progress_bar">
	  						<div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="<%=curNum %>" aria-valuemin="0" aria-valuemax="<%=totalNum %>" style="width: <%=process %>%;"><%=curNum %>/<%=totalNum %></div>
						</div>
					</div>
					<div class="col-xs-1">
						<img src="images/achievement_event/locked.png" alt="" id="account_icon">	
					</div>
				</div>
				<hr>
			</ul>
			<%
					}
				} catch(Exception ex) {
					ex.printStackTrace();
				}
			%>
		</div>		
	</div>
<jsp:include page="footer/footer.jsp" />
