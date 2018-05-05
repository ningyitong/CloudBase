<jsp:include page="header.jsp"/>

<%
    if (session.getAttribute("user")==null)
    {
        response.sendRedirect("dashboard.jsp");
    }
%>

<div class="container" style="margin-left: 80px; margin-right: 80px">
    <div style="margin-top: 120px">
        <h3>Upload your own app</h3>
        <hr>
    </div>
    <form id="upload_app_form" name="uploadAppForm" onsubmit="return ValidateUploadForm(this);" method="post" action="UploadServlet" enctype="multipart/form-data">
        <input type="text" class="upload_input" name="title" placeholder=" Your APP Title   *" required/>
        <input type="number" class="upload_input" min="1" max="200" name="price" placeholder=" APP Price (0-200)    *" required/>
        <br>
        <div class="row" style="margin-top: 15px">
            <div class="col-xs-4 text-left">
                <h5>Select Icon:</h5>
            </div>
            <div class="col-xs-8 text-right">
                <input type="file" id="icon" name="icon"/> <br/>
            </div>
        </div>
        <div>
            <textarea class="form-control" name="description" id="textarea" rows="3" placeholder="Write your APP description here (optional)."></textarea>
        </div>
        <br>
        <div class="row">
            <div class="col-xs-4 text-left">
                <h5>Select APP:</h5>
            </div>
            <div class="col-xs-8 text-right">
                <input type="file" id="upload" name="file" required/> <br/>
            </div>
        </div>
        <div style="text-align:center">
            <input type="submit" value="Upload" id="uploadApp_btn">
        </div>
    </form>
</div>

<jsp:include page="footer.jsp"/>