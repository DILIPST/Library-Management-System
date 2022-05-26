<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
<html>
<head>
    <title>Deletion </title>
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
            width: 360px;
            padding: 8% 0 0;
            margin: auto;
        }
        .login-page .form .login{
            margin-top: -31px;
            margin-bottom: 26px;
        }
        .form {
            position: relative;
            z-index: 1;
            background: #FFFFFF;
            max-width: 450px;
            margin: 0 auto 100px;
            padding: 45px;
            text-align: center;
            box-shadow: 0 0 20px 0 rgba(0, 0, 0, 0.2), 0 5px 5px 0 rgba(0, 0, 0, 0.24);
        }
        .form select {
            font-family: "Roboto", sans-serif;
            outline: 0;
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
        .form .message a {
            color: #FF416C;
            text-decoration: none;
        }
a {
    color: white;
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
<body>
<body>
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
    <div class="form">
        <div class="login">
            <div class="login-header">
                <h3>RETURN BOOK</h3>
                <p>Please Enter book details</p>
            </div>
        </div>
        <form name="f2" method="post" action="returnbooks.jsp">
            <jsp:useBean id="obj" class="com.example.librarym.bookBean"/>
            <jsp:setProperty property="*" name="obj" />
            <%
                String username=String.valueOf(session.getAttribute("Name"));
                String sql="select bookname from issuedbooks where username='"+username+"'";
                try{
                    int i=1;
                    connection = DriverManager.getConnection(connectionUrl, userid, password);
                    statement=connection.createStatement();
                    resultSet = statement.executeQuery(sql);
            %>

                <select name="bookname" id="bookname">
                        <%
                    while(resultSet.next()){
                        String book=resultSet.getString("bookname");
            %>
            <option value="<%=book %>"><%=book %></option>
            <%
                    }
                    %>
                </select>
            </p>
            <%

                    connection.close();
                } catch (Exception e) {
                    e.printStackTrace();
                }
            %>
            <button type="Submit" name="submit1"  >Return</button>
        </form>
    </div>
</div>
</body>
</body>
</html>