<%@ page import="com.example.librarym.bookDAO" %>
<%@ page import="com.example.librarym.memberBEAN" %>
<%@ page import="com.example.librarym.memberDAO" %>
<jsp:useBean id="obj" class="com.example.librarym.memberBEAN"/>
<jsp:setProperty property="*" name="obj" />
<h3>
    haiiii;
</h3>
<%
    int status= memberDAO.insertmember(obj);
    String message;
    if(status>0) {
        message = "Inserted successfully";
    }
    else{
        message = "Insertion failed";
    }
    out.print(message);
    response.sendRedirect("signup.jsp");
%>