package com.example.librarym;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;


public class bookDAO {
    static Connection conn;
    static PreparedStatement pst;

    public static int insertbook(bookBean u) {
        int status = 0;
        String sql = "insert into books(title,author,subject,pdate,count) values(?,?,?,?,?)";
        try {
            conn = ConnectionProvider.getCon();
            pst = conn.prepareStatement(sql);
            pst.setString(1, u.getCutid());
            pst.setString(2, u.getAuthor());
            pst.setString(3, u.getSubject());
            pst.setString(4, u.getPdate());
            pst.setInt(5,u.getCount());
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


    public static int bookcount(String title) {

        Connection connection = null;
        Statement statement = null;
        ResultSet resultSet = null;
        int a=0;
        String sql = "select*from books where title='"+title+"'";
        try {
            conn = ConnectionProvider.getCon();
            statement = conn.createStatement();
            resultSet = statement.executeQuery(sql);
            while(resultSet.next()){
                a = resultSet.getInt("count");
            }

            conn.close();
        } catch (Exception ex) {
            System.out.println(ex);
        }
        return a;
    }
    public static int bookreduce(String title,int a) {

        Connection connection = null;
        Statement statement = null;
        ResultSet resultSet = null;

        String sql = "update books set count = "+a+" where title='"+title+"'" ;
        try {

            conn = ConnectionProvider.getCon();
            statement = conn.createStatement();
            resultSet = statement.executeQuery(sql);
            conn.close();
        } catch (Exception ex) {
            System.out.println(ex);
        }
        return a;
    }
    public static int issuedcount(String title) {

        Connection connection = null;
        Statement statement = null;
        ResultSet resultSet = null;
        int a=0;
        String sql = "select*from members where username='"+title+"'";
        try {
            conn = ConnectionProvider.getCon();
            statement = conn.createStatement();
            resultSet = statement.executeQuery(sql);
            while(resultSet.next()){
                a = resultSet.getInt("count");
            }

            conn.close();
        } catch (Exception ex) {
            System.out.println(ex);
        }
        return a;
    }
    public static int addcount(String title,int a) {

        Connection connection = null;
        Statement statement = null;
        ResultSet resultSet = null;
        String sql = "update members set count = "+a+" where username='"+title+"'" ;
        try {

            conn = ConnectionProvider.getCon();
            statement = conn.createStatement();
            resultSet = statement.executeQuery(sql);
            conn.close();
        } catch (Exception ex) {
            System.out.println(ex);
        }
        return a;
    }

    public static int deletecount(String title,int a) {

        Connection connection = null;
        Statement statement = null;
        ResultSet resultSet = null;
        String sql = "update members set count = "+a+" where username='"+title+"'" ;
        try {

            conn = ConnectionProvider.getCon();
            statement = conn.createStatement();
            resultSet = statement.executeQuery(sql);
            conn.close();
        } catch (Exception ex) {
            System.out.println(ex);
        }
        return a;
    }
    public static int deleteissuedbooks(String name,String username) {
        int status = 0;
        String sql = "delete from issuedbooks where username=? and bookname=?";
        try {
            conn = ConnectionProvider.getCon();
            pst = conn.prepareStatement(sql);
            pst.setString(1, username);
            pst.setString(2,name);
            status = pst.executeUpdate();

            conn.close();
        } catch (Exception ex) {
            System.out.println(ex);
        }

        return status;
    }
    public static int addbookcount(String title,int a) {

        Connection connection = null;
        Statement statement = null;
        ResultSet resultSet = null;
        String sql = "update books set count = "+a+" where title='"+title+"'" ;
        try {

            conn = ConnectionProvider.getCon();
            statement = conn.createStatement();
            resultSet = statement.executeQuery(sql);
            conn.close();
        } catch (Exception ex) {
            System.out.println(ex);
        }
        return a;
    }
    public static String  reservedbooks(String username) {
        int status = 0;
        String name = null;
        try {
            name = null;
            conn = ConnectionProvider.getCon();
            PreparedStatement pst = conn.prepareStatement("Select bookname from reservedbooks where username=?");
            pst.setString(1, username);
            ResultSet rs = pst.executeQuery();

            while (rs.next()) {
                name = rs.getString("bookname");
            }
            conn.close();
        } catch (Exception ex) {
            System.out.println(ex);
        }

        return name;
    }
    public static String  availbooks(String bookname) {
        int status = 0;
        String name = null;
        try {
            name = null;
            conn = ConnectionProvider.getCon();
            PreparedStatement pst = conn.prepareStatement("Select title from books where title=? and count between 1 and 5");
            pst.setString(1, bookname);
            ResultSet rs = pst.executeQuery();

            while (rs.next()) {
                name = rs.getString("title");
            }
            conn.close();
        } catch (Exception ex) {
            System.out.println(ex);
        }

        return name;
    }
}