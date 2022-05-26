<%@ page import="com.example.librarym.bookDAO" %>
<%@ page import="com.example.librarym.memberBEAN" %>
<%@ page import="com.example.librarym.memberDAO" %>
<jsp:useBean id="obj" class="com.example.librarym.memberBEAN"/>
<jsp:setProperty property="*" name="obj" />
<h3>
</h3>
<%
    int status= memberDAO.insertmember(obj);
    String message;
    if(status>0) {
        { %>
        <script>
         alert("DATA ADDED SUCCESSFULLY");
         window.location.href="signup.jsp";
          </script>
        <%}
    }
            if(status==0) {
                { %>
                 <script>
                 alert("DATA  NOT ADDED");
                 window.location.href="signup.jsp";
                 </script>
                 <%}
}
%>