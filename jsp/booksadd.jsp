        <%@ page import="com.example.librarym.bookDAO" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="static java.lang.System.out" %>
<%@ page import="java.sql.*" %>
<%@ page import="com.example.librarym.ConnectionProvider" %>
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
  int status = 0;%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>Title</title>
    <script>

      var status =<%=status%>;
      if (status != 0)
        status = "Taken book Successfully";
      else {
        status = "Your limit is Over";
      }
      alert(status);

    </script>
  </head>
  <body>
  <%

    String name = request.getParameter("id");
    String username = String.valueOf(session.getAttribute("Name"));
    int a = 0, b = 0;
    int count = 0;
    count = bookDAO.bookcount(name);

    int issuedcount = bookDAO.issuedcount(username);
    if (issuedcount > 5) {
      issuedcount = 5;
    }
    status = 0;
    if (count > 0) {
      if (issuedcount < 5) {

        String sql = "insert into issuedbooks(bookname,username) values(?,?)";
        a = bookDAO.bookreduce(name, --count);
        b = bookDAO.addcount(username, ++issuedcount);
        out.print("The returned value is=" + b);
        status = 0;
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

      } else {
        out.print("your limit is over");
      }
    } else {
      out.print("Cannot take book");
    }
    session.setAttribute("Status", status);
  %>
  </body>
  <% response.sendRedirect("takebook.jsp");%>
</html>
