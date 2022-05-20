<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <style>
        * {
            box-sizing: border-box;
        }

        body {
            background: #f3e0e2;
            display: flex;
            justify-content: center;
            align-items: center;
            flex-direction: column;
            font-family: 'Montserrat', sans-serif;
            height: 100vh;
            margin: -20px 0 50px;
        }

        h1 {
            font-weight: bold;
            margin: 0;
        }

        p {
            font-size: 14px;
            font-weight: 100;
            line-height: 20px;
            letter-spacing: 0.5px;
            margin: 20px 0 30px;
        }

        span {
            font-size: 12px;
        }

        a {
            color: #333;
            font-size: 14px;
            text-decoration: none;
            margin: 15px 0;
        }

        .mm button{
            border-radius: 20px;
            border: 1px solid #FF4B2B;
            background-color: #FF4B2B;
            color: #FFFFFF;
            font-size: 12px;
            font-weight: bold;
            padding: 12px 45px;
            letter-spacing: 1px;
            text-transform: uppercase;
            transition: transform 80ms ease-in;
        }
        a{
            color: #FF4B2B;
        }


        form {
            background-color: #FFFFFF;
            display: flex;
            align-items: center;
            justify-content: center;
            flex-direction: column;
            padding: 0 50px;
            height: 100%;
            text-align: center;
        }

        input {
            background-color: #eee;
            border: none;
            padding: 12px 15px;
            margin: 8px 0;
            width: 100%;
        }

        .container {
            background-color: #fff;
            border-radius: 100px;
            box-shadow: 0 14px 28px rgba(0,0,0,0.25), 0 10px 10px rgba(0,0,0,0.22);
            position: relative;
            align-content: center;
            overflow: hidden;
            width: 768px;
            max-width: 100%;
            min-height: 480px;
        }



        .social-container {
            margin: 50px 0;
        }

        .social-container a {
            border: 1px solid #DDDDDD;
            border-radius: 50%;
            display: inline-flex;
            justify-content: right;
            align-items: center;
            margin: 0 5px;
            height: 40px;
            width: 40px;
        }

    </style>
</head>
    <body>
<div class="container" id="container">
    <div class="form-container log-in-container">
        <form action="Validation2.jsp">
            <h1> Admin Login</h1>
            <div class="social-container">
            <input type="text" placeholder="UserId" name="adminame" />
            <input type="password" placeholder="Password" name="pwd" />
            <div class="mm">
                <button onclick="myFunction()"> Log In</button>
            </div>
            </div>
        </form>
    </div>
    <script>
        function myFunction() {
            alert("Successfully logged in");
        }
    </script>
     </body>
</html>
