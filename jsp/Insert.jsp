<%@ page import="com.example.librarym.bookDAO" %>
<jsp:useBean id="obj" class="com.example.librarym.bookBean"/>
<jsp:setProperty property="*" name="obj" />
<%
    int status= bookDAO.insertbook(obj);
    String message;
    if(status>0) {
        message = "Inserted successfully";
    }
    else{
        message = "Insertion failed";
    }
    out.print(message);
    response.sendRedirect("add.jsp");
%>
