<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" import="com.example.librarym "%>
<%@ page import="com.example.librarym.bookDAO" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <style>

        body{
            font-family: 'Poppins', sans-serif;
            text-align: center;
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
        nav ul{
            display: inline-block;
            list-style-type: none;
        }
        nav ul li{
            display: inline-block;
            margin-right:20px;
        }
        /*for menu links*/
        a{
            text-decoration: none;
            color:#555;
        }
        p{
            color:#555;
        }
        .container{
            max-width: 1300px;/*width of the header section will not be more than 1300px*/
            margin: auto;
            padding-left: 25px;
            padding-right: 25px;
        }
    </style>
</head>
<body BGCOLOR="	#FFEFD5">
<div class="header">
    <div class="container">


        <div class="navbar">
            <nav>
                <ul id="MenuItems"><!--use this id in js-->
                    <li><a href="customer.jsp">CREATE DATA</a></li>
                    <li><a href="update.jsp">UPDATE DATA</a></li>
                    <li><a href="delete.jsp">DELETE DATA</a></li>
                    <li><a href="Read.jsp">READ DATABASE</a></li>
                    <li><a href="rs.jsp">READ SINGLE DATA</a></li>
                </ul>
            </nav></div>
        <jsp:useBean id="obj" class="com.example.librarym.bookBean"/>
        <jsp:setProperty property="*" name="obj" />
            <%

    int status= bookDAO.updateStudent(obj);
    String message;
    if(status>0) {
        message = "Updated successfully";

    }
    else if(status==-1)
        {
            message="No Updation is done";
        }
    else{
        message = "No such Student id to Update.";
    }
    out.print(message);
     response.sendRedirect("Edit.jsp");
%>
</body>
</html>