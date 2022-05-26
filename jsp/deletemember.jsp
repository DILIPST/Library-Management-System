        <%@ page import="com.example.librarym.bookDAO" %>

<html>
<head>
    <title>Delete Member</title>
</head>
<body>
<%@page import="java.sql.*,java.util.*"%>

<%
    // int  id= Integer.valueOf(request.getParameter("id"));
    String id = request.getParameter("id");
    int i = 0;
    try {
        Class.forName("org.postgresql.Driver");
        String username = "postgres";
        String pwd = "srec@123";
        String connURL = "jdbc:postgresql://localhost:5432/postgres";
        Connection conn = DriverManager.getConnection(connURL, username, pwd);
        Statement st = conn.createStatement();
        String sql = "DELETE FROM members WHERE name='" + id + "'";

        i = st.executeUpdate(sql);

    } catch (Exception e) {
        System.out.print(e);
        e.printStackTrace();
    }
    if (i > 0) {
        {%>
    <script>
                alert("Deleted the member");
        window.location.href="memberpage.jsp";
            </script>
<%}
    }
    if (i == 0) {
        {%>
<script>
    alert("Unable To Delete");
    window.location.href="memberpage.jsp";
</script>
<%}
}
%>
</body>
</html>
