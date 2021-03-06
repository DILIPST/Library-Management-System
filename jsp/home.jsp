<%@ page import="com.example.librarym.bookDAO" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<%String un=String.valueOf(session.getAttribute("Name"));
%>
<head>
    <title>Student Management System</title>
    <style>
        #title {text-align: center; font-size: 25px; padding-bottom: 50px}
        ul {text-align: center; font-size: 100px;}
        .mm{text-align: justify;}
        div img { text-align: center;
            margin-left: 20px;
            display: inline-block; width: 300px; height: 150px;}
        div:after {content: ''; display: inline-block; width: 100%;}
        body {
            align-content: center;
            margin-left: 100px;
            margin-right: 100px;
            background: -webkit-linear-gradient(to right, #FF4B2B, #FF416C);
            background:linear-gradient(to right, #FF4B2B, #FF416C);
            display: flex;
            justify-content: center;
            align-items: center;
            flex-direction: column;
            font-family: 'Montserrat', sans-serif;

        }
        .su{
            align-content: right;
        }
        button{

            border-radius: 20px;
            border: 1px solid #ffffff;
            background-color: #FFFFFF;
            color: #FF4B2B;
            font-size: 12px;
            font-weight: bold;
            padding: 12px 45px;
            letter-spacing: 1px;
            text-transform: uppercase;
            vertical-align: bottom;
            transition: transform 80ms ease-in;
        }
        table{
            position: relative;
            z-index: 1;
            background-color: lightsalmon;
            max-width: 100px;
            margin:  10px;
            padding: 80px;
            text-align: center;
            box-shadow: 0 0 20px 0 rgba(0, 0, 0, 0.2), 0 5px 5px 0 rgba(0, 0, 0, 0.24);
            font-family: "Roboto", sans-serif;
            outline: 0;
            width: 75%;
            border: 10px;
            box-sizing: border-box;
            font-size: 14px;
        }

    </style>
</head>
<body>
<h3><p >LIBRARY MANAGEMENT SYSTEM<p></h3>
<div class="su">
    <a href="memberpage.jsp"><button type="button" >MEMBERS</button></a>

    <a href="takebook.jsp?id=<%=un%>"><button type="button" >Take Book</button></a>
    <a href="reservebook.jsp?id=<%=un%>"><button type="button" >ReserveBook</button></a>

</div>
<div class="mm">


    <%
        String namer=String.valueOf(session.getAttribute("Name"));
        String  a= bookDAO.reservedbooks(namer);
        if(a!=null)
        {
            String book=bookDAO.availbooks(a);
            if(book!=null)
            {
                out.print(book+"You reserved is available to take now!!");
            }
        }
    %>
    <table>
        <tr>
            <td><a href="add.jsp"><img src="Images/add.png" alt=""  /></></td>
            <td><a href="display.jsp"><img src="Images/download.jpg" alt="" /></a></td>
        </tr>
        <tr>
            <td>  <a href="Edit.jsp"><img src="Images/istockphoto-1222550815-170667a.jpg" alt="" /></a></td>
            <td><a href="Login.jsp"><img src="Images/images.png" alt="" /></a></td>
        </tr>

    </table>
</div>
</body>
</html>