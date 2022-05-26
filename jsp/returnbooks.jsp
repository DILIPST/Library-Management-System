        <%@ page import="com.example.librarym.bookDAO" %>
<jsp:useBean id="obj" class="com.example.librarym.bookBean"/>
        <jsp:setProperty property="*" name="obj" />
        <%
            String name = String.valueOf(session.getAttribute("Name"));
            int c = bookDAO.issuedcount(name);
            int status = 0;
            if (c > 0) {
                int count = bookDAO.deletecount(name, --c);
                String bookname=request.getParameter("bookname");
                System.out.print(bookname);
                int counter = bookDAO.bookcount(bookname);
                out.print(counter + "counter");
                int counter2 = bookDAO.addbookcount(bookname, ++counter);
                out.print("counter2=" + counter2);

                status = bookDAO.deleteissuedbooks(bookname, name);
            }
            String message;
            if (status > 0) {
                    %>
        <script>
                alert("Book returned Successfully");
                window.location.href="returnbook.jsp";
        </script>
        <%
            }
            if(status==0) {
                %>
        <script>
                alert("Book is not returned");
                window.location.href="returnbook.jsp";
        </script>
        <%
            }

        %>

