
<%@ page import="java.sql.*" %>
<%
    String id = request.getParameter("userid");
    String driver = "org.postgresql.Driver";
    String connectionUrl = "jdbc:postgresql://localhost:5432/postgres";
    String database = "postgres";
    String userid = "postgres";
    String password = "srec@123";
    try {
        Class.forName(driver);
    } catch (ClassNotFoundException e) {
        e.printStackTrace();
    }
    Connection connection = null;
    Statement statement = null;
    ResultSet resultSet = null;
String name= request.getParameter("id");
String username=String.valueOf(session.getAttribute("Name"));
    String sql = "insert into reservedbooks(bookname,username) values(?,?)";
    int status = 0;
    try {
        connection = DriverManager.getConnection(connectionUrl, userid, password);
        PreparedStatement pst = connection.prepareStatement(sql);
        pst.setString(1, name);
        pst.setString(2, username);
        status = pst.executeUpdate();
        connection.close();

    } catch (Exception ex) {
        System.out.println(ex);
    }
if(status>0)
{
   out.print("sucessfull");
   response.sendRedirect("reservebook.jsp");
}
%>

