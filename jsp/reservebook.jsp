<%@ page import="java.util.ArrayList" %>
<%@ page import="static java.lang.System.out" %>
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
%>
<!DOCTYPE html>
<html>
<head>
    <style>
        header .header{
            background-color: #fff;
            height: 45px;
        }
        header a img{
            width: 134px;
            margin-top: 4px;
        }
        .login-page {
            width: 100%;
            padding: 8% 0 0;
            margin: auto;
        }
        .login-page .form .login{
            margin-top: -31px;
            margin-bottom: 26px;
        }
        table
        {
            position: relative;
            z-index: 1;
            background: #FFFFFF;
            max-width: 3000px;
            margin:  0px;
            padding: 10px;
            text-align: center;
            box-shadow: 0 0 20px 0 rgba(0, 0, 0, 0.2), 0 5px 5px 0 rgba(0, 0, 0, 0.24);
            font-family: "Roboto", sans-serif;
            outline: 0;
            width: 100%;
            border: 0;
            box-sizing: border-box;
            font-size: 14px;

        }
        tr{
            background-color: aliceblue;
        }
        th{
            background-color: darksalmon;
        }
        .form input {
            font-family: "Roboto", sans-serif;
            outline: 0;
            display: inline;
            background: #f2f2f2;
            width: 100%;
            border: 0;
            margin: 0 0 15px;
            padding: 15px;
            box-sizing: border-box;
            font-size: 14px;
        }
        button {
            font-family: "Roboto", sans-serif;
            text-transform: uppercase;
            outline: 0;
            background-color: #FF416C;
            background-image: linear-gradient(to right, #FF4B2B, #FF416C);
            width: 100%;
            border: 0;
            padding: 15px;
            color: #FFFFFF;
            font-size: 14px;
            -webkit-transition: all 0.3 ease;
            transition: all 0.3 ease;
            cursor: pointer;
        }
        .form .message {
            margin: 15px 0 0;
            color: #b3b3b3;
            font-size: 12px;
        }
        a{
            color:white;
        }
        .form .message a {
            color: #FF416C;
            text-decoration: none;
        }
        nav ul{
            display: inline-block;
            list-style-type: none;
        }
        nav ul li{
            display: inline-block;
            margin-right:20px;
        }
        .navbar{
            display: flex;
            align-items: center;
            padding: 20px;

        }
        nav{
            flex: 1;
            text-align: right;
        }

        body {
            background-color:#FF416C;
            background-image: linear-gradient(to right, #FF4B2B, #FF416C);
            font-family: "Roboto", sans-serif;
            -webkit-font-smoothing: antialiased;
            -moz-osx-font-smoothing: grayscale;
        }
    </style>

</head>
<body BGCOLOR="	#FFEFD5"  action="delete.jsp">
<div class="navbar">
    <nav>
        <ul id="MenuItems"><!--use this id in js-->
            <li><a href="takebook.jsp">TAKE BOOK</a></li>
            <li><a href="returnbook.jsp">RETURN BOOK</a></li>
            <li><a href="reservebook.jsp">RESERVE BOOK</a></li>
            <li><a href="Login.jsp"><button type="button"  class="delete">LOGOUT</button></a></li>

        </ul>
    </nav></div>
<div class="login-page">

    <h3>Details</h3>
    <p>Please  Select the book </p>

    <table border="1">
        <tr>
            <th>Title</th>
            <th> Upto Date</th>
            <th>Reserve date</th>
            <th>Reserve</th>
        </tr>
        <jsp:useBean id="obj" class="com.example.librarym.bookBean"/>
        <jsp:setProperty property="*" name="obj" />
        <%
            String a=obj.getCutid();
            String au=obj.getAuthor();
            String su= obj.getSubject();
            String date=obj.getPdate();
            String sql="select*from issuedbooks ";

            try{
                connection = DriverManager.getConnection(connectionUrl, userid, password);
                statement=connection.createStatement();
                out.print(".");
                resultSet = statement.executeQuery(sql);

                while(resultSet.next()){
        %>
        <tr>
            <td><%=resultSet.getString("bookname") %></td>
            <td><%=resultSet.getString("untildate") %></td>
            <td><input type="date" min=<%=resultSet.getString("untildate") %>></td>
            <td><a href="conformr.jsp?id=<%=resultSet.getString("bookname")%>&date1=<%=resultSet.getString("untildate")%>"><button type="button">Reserve</button></a></td>
        </tr>
        <%
                }
                connection.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        %>

    </table>
</div>
</body>
</html>

