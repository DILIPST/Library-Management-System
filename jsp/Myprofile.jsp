<%@ page import ="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>My Profile</title>
    <style>
 body{
     background-color: #FF416C;
     background-image: linear-gradient(to left, limegreen, whitesmoke);

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
     color:#FF4B2B ;
 }
        button{
            background-color: lawngreen;
            color: white;
            height: 30px;
            border-radius: 4px;
            outline: none;
            border: 0px solid white;
            width: 100%;
            margin: 0px 2%;
            letter-spacing: 5px;
            padding: 5px 0px;
            text-transform: uppercase;
            box-shadow: 1px 1px 2px 2px rgba(17,66,55,0.4),
            -1px -1px 2px 2px rgba(17,66,55,0.4);
        }
        button:hover{
            background-color: white;
            color: #FF416C;
            box-shadow: 1px 1px 2px 2px rgba(17,66,55,0.4),
            -1px -1px 2px 2px rgba(17,66,55,0.4);
        }

        input[type="text"],input[type="email"]{
            background-color: transparent;
            box-shadow: 1px 1px 2px 2px rgba(17,66,55,0.4),
            -1px -1px 2px 2px rgba(17,66,55,0.4);

            width: 100%;
            line-height: 2.0;
            border: 0px solid white;
            color: #FF416C;
            font-size: 15px;
        }


.edit{
    padding 40px;
}

        #admin_information *{
            margin:2%;
        }

        label{
            border: none;
            background-color: #FF416C;
            background-image: linear-gradient(to right, limegreen, lightgreen);
            width: 920px;
            padding: 10px 40px;
            display: inline-block;
            font-family: 'Lato';
            text-transform: uppercase;
            letter-spacing: 2px;
            border-bottom: 0.5px solid gray;

        }
        .dd
        {
            background-color: light grey;
            width:1000px;
            border:15px white;
            Height:auto;
            text-align:center;
            border:lightskyblue;
            margin-left: auto;
            margin-right: auto;
        }
        tr{
            display: inline-block;
            padding: 0 auto;
            margin: 0 auto;
        }
        td{
            color: white;
            display: inline-block;
            width: 900px;
            background-color: yellow;
            padding: 5px 5px;
            text-align: center;
            border-radius: 4px;
        }
        m{
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
    Statement statement = null;
    ResultSet resultSet = null;
%>
<%String un=String.valueOf(session.getAttribute("Name"));
%>
<body>
<div class="navbar">
    <nav>
        <ul id="MenuItems"><!--use this id in js-->
            <li><a href="takebook.jsp">TAKE BOOK</a></li>
            <li><a href="returnbook.jsp">RETURN BOOK</a></li>
            <li><a href="reservebook.jsp">RESERVE BOOK</a></li>

        </ul>
    </nav></div>

<div class="mm">
    <h1>My Profile:</h1>
    <table border="1">


        <%
            try{
                connection = DriverManager.getConnection(connectionUrl, userid, password);
                statement=connection.createStatement();
                String sql ="select * from members where username='"+un+"'";
                resultSet = statement.executeQuery(sql);
                while(resultSet.next()){
        %>
        <div class="dd">
        <label>Name:<m> <%=resultSet.getString("name") %></m></label>
        <label>Address:<m><%=resultSet.getString("add") %></m></label>
        <label>Contact number:<m><%=resultSet.getString("Phonenumber") %></m></label>
        <label>Mail ID:<m><%=resultSet.getString("mail") %></m></label>
        <label>Username:<m><%=resultSet.getString("username") %></m></label>
        <label>Password:<m><%=resultSet.getString("pwd") %></m></label>
            <div class="edit">
                <label> Status:<m><%=resultSet.getString("mem")%></m></label>
        <label><m><a href="editmember.jsp?id=<%=resultSet.getString("name")%>"><button type="button"  class="delete">Edit</button></a></m></label>
                <label><m><a href="Login.jsp"><button type="button"  class="delete" onclick="myFunction()">Sign Out</button></a></m></label>
                <label><m><a href="request.jsp"><button type="button"  class="delete">Request to become a member</button></a></m></label>
        </div>
        </div>
                <%
                }
                connection.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        %>
    </table>
    <script>
        function myFunction()
        {
            alert("Signed Out from the account");
        }

    </script>
</div>
</body>
</html>