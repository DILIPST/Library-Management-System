
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
        message = "Updated successfully";

    }
    else if(status==-1)
        {
            message="No Updation is done";
        }
    else{
        message = "No such Student id to Update.";
    }
    out.print(message);
%>
</body>
</html>

