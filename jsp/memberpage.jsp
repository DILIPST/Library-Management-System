<%@ page import ="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Search and Manage member</title>
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
            padding: 10px;
        }
        th{
            background-color: darksalmon;
        }
        .login-page .form .login{
            margin-top: -31px;
            margin-bottom: 26px;
        }


        a{
            color: white;
        }
        nav ul{
            display: inline-block;
            list-style-type: none;
        }
        nav ul li{
            display: inline-block;
            margin-right:20px;
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
<body>
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
        </ul>
    </nav>
</div>
        <div class="login-page">
            <h1>Details of Members in the Library</h1>
            <table border="1">
                <tr>
                    <th>Name</th>
                    <th>Address</th>
                    <th>Contact number</th>
                    <th>Mail ID</th>
                    <th>Username</th>
                    <th>Password</th>
                    <th>Delete</th>
                    <th>Edit</th>
                    <th>Books taken</th>
                    <th>membership</th>
                </tr>
                <%
                    try{
                        connection = DriverManager.getConnection(connectionUrl, userid, password);
                        statement=connection.createStatement();
                        String sql ="select * from members";
                        resultSet = statement.executeQuery(sql);
                        while(resultSet.next()){
                %>
                <tr>
                    <td><%=resultSet.getString("name") %></td>
                    <td><%=resultSet.getString("add") %></td>
                    <td><%=resultSet.getString("Phonenumber") %></td>
                    <td><%=resultSet.getString("mail") %></td>
                    <td><%=resultSet.getString("username") %></td>
                    <td><%=resultSet.getString("pwd") %></td>
                    <td><a href="editmember.jsp?id=<%=resultSet.getString("name")%>"><button type="button"  class="delete">Edit</button></a></td>
                    <td><a href="deletemember.jsp?id=<%=resultSet.getString("name")%>"><button type="button"  class="delete">Delete</button></a></td>
                    <td><%=resultSet.getInt("count")%></td>
                    <td><%=resultSet.getString("mem")%></td>
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
