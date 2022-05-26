
<%@ page import="com.example.librarym.memberDAO" %>
<jsp:useBean id="obj" class="com.example.librarym.memberBEAN"/>
<jsp:setProperty property="*" name="obj" />
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
            <%


    int status= memberDAO.updatemember(obj);
    String message;
    if(status>0) {
        %>
            <script>
                alert("Data Updated Successfully");
                window.location.href="editmember.jsp"
            </script>
            <%

    }
                if(status==0) {
            %>
            <script>
                alert("Data is not updated");
                window.location.href="editmember.jsp"
            </script>
            <%
                }
%>
</body>
</html>

