<%@ page import ="java.sql.*" %>
<%
    try{
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        session.setAttribute("Name",username);
        String URL="jdbc:postgresql://localhost:5432/postgres";
        String user="postgres";
        String pwd="srec@123";
        Class.forName("org.postgresql.Driver");
        Connection conn = DriverManager.getConnection(URL,user,pwd);
        PreparedStatement pst = conn.prepareStatement("Select username,pwd from members where username=? and pwd=?");
        pst.setString(1, username);
        pst.setString(2, password);
        ResultSet rs = pst.executeQuery();

        if(rs.next()) {
            {%>
            <script>
           alert("Logged in Successfully");
            window.location.href="memberhome.jsp";
            </script>
           <%
        }
        }
        else {
            out.println("Invalid login credentials");
            response.sendRedirect("Login.jsp");
        }
    }
    catch(Exception e){
        out.println("Something went wrong !! Please try again");
    }
%>
