<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page import="java.sql.*,java.util.*"%>

<html>
<head>
    <title>Title</title>
    <style>
        table
        {
            position: relative;
            z-index: 1;
            background: #FFFFFF;
            max-width: 3000px;
            margin:  0px;
            padding: 15px;
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
        body {
            background-color:#FF416C;
            background-image: linear-gradient(to right, #FF4B2B, #FF416C);
            font-family: "Roboto", sans-serif;
            -webkit-font-smoothing: antialiased;
            -moz-osx-font-smoothing: grayscale;
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
        a{
            color: white;
        }
    </style>
</head>
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
    Statement statement=null;
    Statement statement2= null;
    ResultSet resultSet = null;
    ResultSet rs1=null;
    ArrayList<String> params = new ArrayList<>();
%>
<body >
<div class="navbar">
    <nav>
        <ul id="MenuItems"><!--use this id in js-->
            <li><a href="memberpage.jsp">MEMBER PAGE</a></li>
            <li><a href="editmember.jsp">EDIT MEMBER</a></li>
            <li><a href="addmembership.jsp">ADD MEMBERSHIP</a></li>
            <li><a href="addmember.jsp">ADD MEMBER</a></li>
            <li><a href="membershipview.jsp">VIEW MEMBERSHIP</a></li>
            <li><a href="takebook.jsp">BOOKS</a></li>
            <li><a href="add.jsp">ADD BOOK</a></li>
            <li><a href="display.jsp">DISPLAY BOOK</a></li>
            <li><a href="Edit.jsp">EDIT BOOK</a></li>
            <li><a href="accept.jsp">REQUESTS</a></li>
        </ul>
    </nav>
</div>
<div class="dd">
    <h1>Details of the Membership Holders</h1>
    <table border="1">
        <tr>
            <th>Name</th>
            <th>Status</th>
            <th>Accept Request</th>
            <th>Cancel Request</th>

        </tr>
        <%
            try{
                connection = DriverManager.getConnection(connectionUrl, userid, password);
                statement=connection.createStatement();
                String sql ="select * from requests";
                resultSet = statement.executeQuery(sql);
                while(resultSet.next()){
        %>
        <tr>
            <td><%=resultSet.getString("namer") %></td>
            <td><%=resultSet.getString("accepted") %></td>
            <td><a href="promote.jsp?id=<%=resultSet.getString("namer")%>&date1=<%=resultSet.getString("accepted")%>"><button type="button">Accept</button></a></td>
            <td><a href="demote.jsp?id=<%=resultSet.getString("namer")%>&date1=<%=resultSet.getString("accepted")%>"><button type="button">Cancel</button></a></td>

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
