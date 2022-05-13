<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
        .form input {
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

            color: #eeeeee;
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
            color: #eeeeee;
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
<body>
<body>
<div class="navbar">
    <nav>
        <ul id="MenuItems"><!--use this id in js-->
            <li><a href="add.jsp">ADD BOOK</a></li>
            <li><a href="display.jsp">DISPLAY BOOK</a></li>
            <li><a href="Edit.jsp">EDIT BOOK</a></li>

        </ul>
    </nav></div>
<div class="dd">
<div class="login-page">
    <div class="form">
        <div class="login">
            <div class="login-header">
                <h3>Insert</h3>
                <p>Please Enter book details</p>
            </div>
        </div>
        <form name="f2" method="post" action="Insert.jsp">

            <input type="text" name="cutid" placeholder="Title" >


            <input type="text"  name="author" placeholder="Author" >


            <input type="text" name="subject" placeholder="Subject">


            <input type="date" name="pdate" placeholder="Date">
            <button type="Submit" name="submit1" >Add</button>
        </form>
    </div>
</div>
</body>
</body>
</html>