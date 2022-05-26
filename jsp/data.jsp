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
            max-width: 3000px;
            margin:  0px;
            padding: 45px;
            text-align: center;
            box-shadow: 0 0 20px 0 rgba(0, 0, 0, 0.2), 0 5px 5px 0 rgba(0, 0, 0, 0.24);
        }
        table
        {
            position: relative;
            z-index: 1;
            background: #FFFFFF;
            max-width: 3000px;
            margin:  0px;
            padding: 45px;
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
        .form button {
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
        a{
            color: white;
        }
    </style>

</head>
<body BGCOLOR="	#FFEFD5"  action="delete.jsp">
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
    </nav></div>
<div class="login-page">
    <div class="form">
        <div class="login">
            <div class="login-header">
                <h3>Details</h3>
                <p>Please book details</p>
            </div>
        </div>
        <form name="f2" method="post" >

            <input type="text" name="cutid" placeholder="Title" >


            <input type="text"  name="author" placeholder="Author" >


            <input type="text" name="subject" placeholder="Subject">


            <input type="date" name="pdate" placeholder="Date">
            <button type="Submit" name="submit1" >Search</button>
        </form>
    </div>
</div>
            <table border="1">
                <tr>
                    <th>Title</th>
                    <th> Author Name</th>
                    <th>Subject</th>
                    <th>Publication Date</th>
                    <th>Delete</th>
                    <th>Number</th>
                </tr>
                <jsp:useBean id="obj" class="com.example.librarym.bookBean"/>
                <jsp:setProperty property="*" name="obj" />
                <%
                     String a=obj.getCutid();
                     String au=obj.getAuthor();
                     String su= obj.getSubject();
                     String date=obj.getPdate();
                    boolean added = false;
                    boolean whe=true;
                    String sql="select*from books";
                   if(a!=null)
                   {
                       if(whe) sql+=" where ";
                       sql += " title='"+a+"' ";
                       added = true;
                       whe=false;
                   }
                    if(au!=null)
                    {
                        if(whe) sql+=" where ";
                        if (added) sql +="and";
                        sql += " author='"+au+"'";
                        added = true;
                        whe=false;
                    }
                    if(su!=null)
                    {
                        if(whe) sql+=" where ";
                        if (added) sql +="and";
                        sql += " subject='"+su+"'";
                        added = true;
                        whe=false;
                    }
                    if(date!=null)
                    {
                        if(whe) sql+=" where ";
                        if (added) sql +="and";
                        sql += " pdate= '"+date+"'";
                        added = true;
                        whe=false;
                    }
                    try{
                        int i=1;
                        connection = DriverManager.getConnection(connectionUrl, userid, password);
                        statement=connection.createStatement();
                           out.print(".");
                        resultSet = statement.executeQuery(sql);

                        while(resultSet.next()){
                %>
                <tr>
                    <td><%=resultSet.getString("title") %></td>
                    <td><%=resultSet.getString("author") %></td>
                    <td><%=resultSet.getString("subject") %></td>
                    <td><%=resultSet.getString("pdate") %></td>
                    <td><a href="delete.jsp?id=<%=resultSet.getInt("id")%>"><button type="button"  class="delete">Delete</button></a></td>
                    <td><%=i++%></td>
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
