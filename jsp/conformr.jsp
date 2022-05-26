
<%@ page import="java.sql.*" %>
<%@ page import="com.example.librarym.bookDAO" %>
<%@ page import="java.time.LocalDate" %>
<%
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
String date=request.getParameter("date1");
System.out.println(date);
String username=String.valueOf(session.getAttribute("Name"));
    String sql = "insert into reservedbooks(bookname,username,fromdate,todate) values(?,?,?,?)";
    String sql1="update issuedbooks set untildate=? where title=?",sql2="update issuedbooks set untildate=? where bookname=?";
    int status = 0;
    int s= bookDAO.memberornot(username);
    LocalDate myObj = LocalDate.parse(date);
    LocalDate date2;
    if(s!=0)
    {

        date2 = myObj.plusDays(5);
    }
    else {
        date2 = myObj.plusDays(3);
    }
    System.out.println(date2);
    try {
        connection = DriverManager.getConnection(connectionUrl, userid, password);
        PreparedStatement pst = connection.prepareStatement(sql);
        pst.setString(1, name);
        pst.setString(2, username);
        pst.setObject(3,myObj);
        pst.setObject(4,date2);
        status = pst.executeUpdate();
        PreparedStatement pst2=connection.prepareStatement(sql2);
        pst2.setObject(1,date2);
        pst2.setString(2,name);
        status= pst2.executeUpdate();
        PreparedStatement pst1 = connection.prepareStatement(sql1);
        pst1.setObject(1,date2);
        pst1.setString(2,name);
        status=pst1.executeUpdate();
        connection.close();

    } catch (Exception ex) {
        System.out.println(ex);
    }
if(status>0)
{{%>
<script>
    alert("Your Reservation has been Done");
    window.location.href="reservebook.jsp"
</script>
   <%
}
       }
if(status==0)
{%>
<script>
    alert("Reservation is denied");
    window.location.href="reservebook.jsp"
</script>
<%
}
%>

