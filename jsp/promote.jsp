<%@ page import ="java.sql.*" %>
<%@ page import="java.time.LocalDate" %>

<%
    int rs=0;
    try{
        String username = request.getParameter("id");
        String s=request.getParameter("date1");
        String no="yes";
        System.out.println("the count returned is"+s);
        session.setAttribute("Name",username);
        String URL="jdbc:postgresql://localhost:5432/postgres";
        String user="postgres";
        String pwd="srec@123";
        LocalDate myObj = LocalDate.now();
        LocalDate date2=myObj.plusDays(365);
        System.out.print(date2);
        Class.forName("org.postgresql.Driver");
        Connection conn = DriverManager.getConnection(URL,user,pwd);
        PreparedStatement pst = conn.prepareStatement("update members set mem='yes',validtill=? where username=?");
        pst.setObject(1,date2);
        pst.setString(2, username);
        rs = pst.executeUpdate(); PreparedStatement pst1 = conn.prepareStatement("delete from requests where namer=?");
        pst1.setString(1, username);
        rs = pst1.executeUpdate();
        PreparedStatement pst2 = conn.prepareStatement("insert into notification(username,status) values(?,?)");
        pst2.setString(1, username);
        pst2.setString(2,no);
        rs = pst2.executeUpdate();
        if(rs>0) {
            if(s==null)
            {
            %>
<script>
    alert("Promoted Successfully");
    window.location.href="membershipview.jsp";
</script>
<%

    }
            else{
%>
<script>
    alert("Accepted");
    window.location.href="accept.jsp";
</script>
<%
    }
}
else {
        if(s==null)
        {
            %>
<script>
    alert("Promoted Successfully");
    window.location.href="membershipview.jsp";
</script>
<%

}
else{
%>
<script>
    alert("Not accepted");
    window.location.href="accept.jsp";
</script>
<%
            }
}
}
catch(Exception e){
    out.println("Something went wrong !! Please try again");
}
%>
