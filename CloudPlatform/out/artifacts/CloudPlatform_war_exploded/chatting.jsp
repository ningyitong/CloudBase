<jsp:include page="header.jsp"/>

<%--<%--%>
    <%--if (session.getAttribute("user")==null)--%>
    <%--{--%>
        <%--response.sendRedirect("dashboard.jsp");--%>
    <%--}--%>
<%--%>--%>


<div id="divMain">
    <div class="divtop" style="margin-top: 120px">
        <div class="divL">
            <h3>Chat Room</h3>
            <div class="divShow" id="divContent"></div>
        </div>
        <div class="divR">
            <h3>Online Member</h3>
            <div class="divShow" id="divOnLine"></div>
        </div>
    </div>
    <div class="divBot">
        <table cellpadding="0" cellspacing="0">
            <tr><td colspan="2" id="divFace" class="pb"></td></tr><tr><td>
            <textarea id="txtContent" cols="64" rows="3" class="txt"></textarea></td><td class="pl">
            <input id="Button1" type="button" value="Send" class="btn"/>
            <input id="Button2" type="button" value="Exit" onclick="close_window();return false;" class="btn"/>
            <input id="Button4" style="display:none" type="button" value="Hide" class="btn"/>

        </td></tr><tr><td colspan="2" class="pt">Content Cannot Be Empty</td></tr></table>
    </div>
</div>

<jsp:include page="footer.jsp"/>