        <%@ page import="com.example.librarym.bookDAO" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="static java.lang.System.out" %>
<%@ page import="java.sql.*" %>
        <%@ page import=" java.time.LocalDate"%>
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
  </head>
  <body>
  <%

    String name = request.getParameter("id");
    String username = String.valueOf(session.getAttribute("Name"));
    int a = 0, b = 0;
    int count = 0;
    count = bookDAO.bookcount(name);
System.out.println("The count before"+count);
    int issuedcount = bookDAO.issuedcount(username);
    if (issuedcount > 2) {
      issuedcount = 2;
    }
    status = 0;
    int s=bookDAO.memberornot(username);
    LocalDate myObj = LocalDate.now();
    LocalDate date2;
    if(s!=0)
    {

       date2 = myObj.plusDays(5);
    }
    else {
       date2 = myObj.plusDays(3);
    }
    System.out.println(myObj);  // Display the current date
    if (count > 0) {
      if (issuedcount < 2) {
        String sql = "insert into issuedbooks(bookname,username,issueddate,untildate) values(?,?,?,?)";
        a = bookDAO.bookreduce(name, --count);
        b = bookDAO.addcount(username, ++issuedcount);
        System.out.println("The returned value is=" + count);
        status = 0;
        try {
          connection = DriverManager.getConnection(connectionUrl, userid, password);
          PreparedStatement pst = connection.prepareStatement(sql);
          pst.setString(1, name);
          pst.setString(2, username);
          pst.setObject(3,myObj);
          pst.setObject(4,date2);
          status = pst.executeUpdate();
          connection.close();
          if(status>0)
          {
            %>
            <script>
              alert("Book has been Taken Successfully");
              window.location.href="takebook.jsp";
            </script>
            <%
          }

        } catch (Exception ex) {
          System.out.println(ex);
        }

      } else {
             %>
  <script>
    alert("Your limit is over");
    window.location.href="takebook.jsp";
  </script>
  <%
      }
    } else {
         %>
  <script>
    alert("Cannot take book");
    window.location.href="takebook.jsp";
  </script>
  <%
    }
  %>
  </body>

</html>
