<%@ page import="com.example.librarym.bookDAO" %>

<html>
<head>
    <title>Delete Member</title>
</head>
<body>
<%@page import="java.sql.*,java.util.*"%>

<%
   // int  id= Integer.valueOf(request.getParameter("id"));
    String id=request.getParameter("id");
    try
    {
        Class.forName("org.postgresql.Driver");
        String username="postgres";
        String pwd="srec@123";
        String connURL="jdbc:postgresql://localhost:5432/postgres";
        Connection conn = DriverManager.getConnection(connURL,username,pwd);
        Statement st=conn.createStatement();
        String sql="DELETE FROM members WHERE name='"+id+"'";
        System.out.println(sql);

        int i=st.executeUpdate(sql);

    }
    catch(Exception e)
    {
        System.out.print(e);
        e.printStackTrace();
    }
    response.sendRedirect("memberpage.jsp");
%>
</body>
</html>
