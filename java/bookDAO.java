package com.example.librarym;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.ArrayList;

public class bookDAO {
    static Connection conn;
    static PreparedStatement pst;

    public static int insertbook(bookBean u) {
        int status = 0;
        String sql = "insert into books(title,author,subject,pdate) values(?,?,?,?)";
        try {
            conn = ConnectionProvider.getCon();
            pst = conn.prepareStatement(sql);
            pst.setString(1, u.getCutid());
            pst.setString(2, u.getAuthor());
            pst.setString(3, u.getSubject());
            pst.setString(4, u.getPdate());
            status = pst.executeUpdate();

            conn.close();
        } catch (Exception ex) {
            System.out.println(ex);
        }

        return status;
    }

    public static int updateStudent(bookBean u) {
        int status = 0;
        try {
            conn = ConnectionProvider.getCon();

            String name = u.getCutid();
            String add = u.getAuthor();
            String num = u.getSubject();
            String pname = u.getPdate();
            ArrayList<Object> params = new ArrayList<>();
            boolean added = false;
            String query = "update books set ";
            if (add != null) {
                if (added) query += ",";
                query += "author = ?";
                params.add(add);
                added = true;
            }
            if (num != null) {
                if (added) query += ",";
                query += "subject = ?";
                params.add(num);
                added = true;
            }
            if (pname != null) {
                if (added) query += ",";
                query += "pdate = ?";
                params.add(pname);
                added = true;
            }
            if (!added) {
                conn.close();
                return -1;
            }
            query += " where title=?";
            System.out.println(query);
            params.add(u.getCutid());
            pst = conn.prepareStatement(query);
            for (int i = 0; i < params.size(); ++i) {
                Object o = params.get(i);
                if (o instanceof String) pst.setString(i + 1, (String) o);
                else pst.setInt(i + 1, (Integer) o);
            }
            System.out.print(query);
            status = pst.executeUpdate();
            conn.close();


        } catch (Exception ex) {
            System.out.println(ex);
        }

        return status;
    }
    public static int deletebook(bookBean u) {
        int status = 0;
        String sql = "delete from books where title=?";
        try {
            conn = ConnectionProvider.getCon();
            pst = conn.prepareStatement(sql);
            pst.setString(1, u.getCutid());
            status = pst.executeUpdate();

            conn.close();
        } catch (Exception ex) {
            System.out.println(ex);
        }

        return status;
    }
}
