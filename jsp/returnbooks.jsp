        <%@ page import="com.example.librarym.bookDAO" %>
<jsp:useBean id="obj" class="com.example.librarym.bookBean"/>
        <jsp:setProperty property="*" name="obj" />
        <%
            String name = request.getParameter("username");
            int c = bookDAO.issuedcount(name);
            int status = 0;
            if (c > 0) {
                int count = bookDAO.deletecount(name, --c);
                String bookname = request.getParameter("name");
                int counter = bookDAO.bookcount(bookname);
                out.print(counter + "counter");
                int counter2 = bookDAO.addbookcount(bookname, ++counter);
                out.print("counter2=" + counter2);

                status = bookDAO.deleteissuedbooks(bookname, name);
            }
            String message;
            if (status > 0) {
                message = "returned Sucessfully";
                response.sendRedirect("returnbook.jsp");
            } else {
                message = "Unable to return";
            }
            out.print(message);

        %>
