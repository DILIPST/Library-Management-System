        <%@ page import="com.example.librarym.bookDAO" %>
<%@ page import="com.example.librarym.memberDAO" %>

<%@ page import="java.util.ArrayList" %>
<%@ page import="java.time.LocalDate" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<%String un = String.valueOf(session.getAttribute("Name"));
%>
<head>
    <title>Library Management System</title>
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
            border: 1px solid black;
            margin:  0px;
            text-align: center;
            box-shadow: 0 0 20px 0 rgba(0, 0, 0, 0.2), 0 5px 5px 0 rgba(0, 0, 0, 0.24);
            font-family: "Roboto", sans-serif;
            outline: 0;
            width: 1000px;
            box-sizing: border-box;
            font-size: 14px;
        }
        img {
            width: 1510px;
            height: 495px;
            border: 7px #FF416C;
        }

    </style>
</head>
<body>
<h3><p >LIBRARY MANAGEMENT SYSTEM<p></h3>
<div class="su">
    <a href="Myprofile.jsp?id=<%=un%>"><button type="button" >My Profile</button></a>
    <a href="takebook.jsp?id=<%=un%>"><button type="button" >Take Book</button></a>
    <a href="reservebook.jsp?id=<%=un%>"><button type="button" >ReserveBook</button></a>
    <a href="returnbook.jsp"><button type="button" >Return Book</button></a>

</div>
<div class="mm">

    <%
        String namer = String.valueOf(session.getAttribute("Name"));
        ArrayList<Object> userormember = new ArrayList<Object>();
        userormember = memberDAO.userormember(namer);
         int notification=memberDAO.notification(namer);
         String notifi=memberDAO.notifications(namer);
         System.out.println(notifi);
         if(notification>0){
             if(notifi.equals("yes"))
             {
                 %>
    <script>
        alert("You have been Promoted to MEMBER");
    </script>
        <%
             }
             if(notifi.equals("no"))
             {
                 %>
    <script>
        alert("You have been Demoted to USER");
    </script>
    <%
    }
         }
        LocalDate myObj = LocalDate.now();
        String user = String.valueOf(userormember.get(0));
        LocalDate membership = null;
       %> <table>
    <%
        if (user.equals("yes")) {
            membership = LocalDate.parse(String.valueOf(userormember.get(1)));
    %>
    <tr>

        <th> Status: MEMBER</th>
        <th> Expires on: <%=membership%><br></th>
    </tr>
    <%
        }
        else{
    %>
    <tr>
        <th> Status:USER</th>
    </tr>
    <%
        }
    %>
    </table>
<%
    if (user.equals("yes")) {

        if(myObj.compareTo(membership)==0)
        {
    %>
    <table>
        <tr>
            <th><h2>Your Membership has been expired</h2></th>
            <th><a href="request.jsp"><button type="button"  class="delete">Renew Membership</button></a></th>
        </tr>

    </table>
    <%
        }
        }
    %>

    <%

        String a = bookDAO.reservedbooks(namer);
        if (a != null) {
            String book = bookDAO.availbooks(a);
            if (book != null) {
                out.print(book + " !! This book is available for You to take");
            }
        }
        ArrayList<Object> takenbooks = new ArrayList<Object>();
        takenbooks = bookDAO.takenbooks(namer);
    %>
    <table>
        <tr>
        <%
            for (int i = 0; i < takenbooks.size(); ++i) {
                Object o = takenbooks.get(i);
                if (i % 2 == 0) {
        %>

                    <td>Book:<%=o%></td>
                  <%
                          }

                      }
                  %>
        </tr>
        <tr>
            <%
                for (int i = 0; i < takenbooks.size(); ++i) {
                    Object o = takenbooks.get(i);
                    if (i % 2 != 0) {
            %>

            <td>Return on:<%=o%></td>
            <%
                    }

                }
            %>
        </tr>
    </table>
    </div>
<img src="Images/home2.jpg">
</body>
</html>



