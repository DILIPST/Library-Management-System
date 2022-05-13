<%@ page import="com.example.librarym.bookDAO" %>

<html>
<head>
    <title>Title</title>
</head>
<body>
<%@page import="java.sql.*,java.util.*"%>

<%
   int  id= Integer.valueOf(request.getParameter("id"));
    try
    {
        Class.forName("org.postgresql.Driver");
        String username="postgres";
        String pwd="srec@123";
        String connURL="jdbc:postgresql://localhost:5432/postgres";
        Connection conn = DriverManager.getConnection(connURL,username,pwd);
        Statement st=conn.createStatement();
        String sql="DELETE FROM books WHERE id="+id;


        int i=st.executeUpdate(sql);

    }
    catch(Exception e)
    {
        System.out.print(e);
        e.printStackTrace();
    }
    response.sendRedirect("data.jsp");
%>
</body>
</html>
