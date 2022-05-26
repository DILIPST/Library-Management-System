<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.example.librarym.bookDAO" %>
<%@ page import="com.example.librarym.memberBEAN" %>
<%@ page import="com.example.librarym.memberDAO" %>
<jsp:useBean id="obj" class="com.example.librarym.memberBEAN"/>
<jsp:setProperty property="*" name="obj" />
<h3>
</h3>
<%
    String username=String.valueOf(session.getAttribute("Name"));
    int status= memberDAO.inserttorequest(username);
    String message;
    if(status>0) {
        { %>
<script>
    alert("Request Sent");
    window.location.href="Myprofile.jsp";
</script>
<%}
}
    if(status==0) {
        { %>
<script>
    alert("Waiting for approval");
    window.location.href="Myprofile.jsp";
</script>
<%}
}
%>