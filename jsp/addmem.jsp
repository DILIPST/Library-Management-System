<%@ page import="com.example.librarym.memberDAO" %>
<jsp:useBean id="obj" class="com.example.librarym.memberBEAN"/>
<jsp:setProperty property="*" name="obj" />
<%
    int status= memberDAO.insertmembership(obj);
    String message;
    if(status>0) {
        message = "Inserted successfully";
        response.sendRedirect("addmembership.jsp");
    }
    else{
        message = "Insertion failed";
    }
    out.print(message);
%>