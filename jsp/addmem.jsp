<%@ page import="com.example.librarym.memberDAO" %>
<jsp:useBean id="obj" class="com.example.librarym.memberBEAN"/>
<jsp:setProperty property="*" name="obj" />
<%
    int status= memberDAO.insertmembership(obj);
    String message;
    if(status>0) {
        %>
<script>
    alert(" Membership Added Successfully");
    window.location.href="addmembership.jsp"
</script>
<%

    }
    else{
        %>
<script>
    alert("Not added");
    window.location.href="addmembership.jsp"
</script>
<%

    }

%>