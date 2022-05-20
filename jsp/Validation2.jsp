<%@ page import ="java.sql.*" %>
<%

    try{
        String adminname = request.getParameter("adminame");
        String password = request.getParameter("pwd");
        String URL="jdbc:postgresql://localhost:5432/postgres";
        String user="postgres";
        String pwd="srec@123";
        Class.forName("org.postgresql.Driver");
        Connection conn = DriverManager.getConnection(URL,user,pwd);
        PreparedStatement pst = conn.prepareStatement("Select adminame,pwd from admin  where adminame=? and pwd=?");
        pst.setString(1,adminname);
        pst.setString(2, password);
        ResultSet rs = pst.executeQuery();
        if(rs.next()) {
            out.println("Valid login credentials");
            response.sendRedirect("home.jsp");

        }
        else {
            out.println("Invalid login credentials");
            response.sendRedirect("adminlogin.jsp");
        }
    }
    catch(Exception e){
 out.print("Something went wrong plz check it");
    }
%>

