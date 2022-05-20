package com.example.librarym;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.ArrayList;


public class memberDAO {
    static Connection conn;
    static PreparedStatement pst;

    public static int insertmember(memberBEAN u) {
        int status = 0;
        String sql = "insert into members(name,add,phonenumber,mail,username,pwd) values(?,?,?,?,?,?)";
        try {
            conn = ConnectionProvider.getCon();
            pst = conn.prepareStatement(sql);
            pst.setString(1, u.getName());
            pst.setString(2, u.getAdd());
            pst.setString(3, u.getPhno());
            pst.setString(4, u.getMail());
            pst.setString(5,u.getUsername());
            pst.setString(6,u.getPwd());
            status = pst.executeUpdate();

            conn.close();
        } catch (Exception ex) {
            System.out.println(ex);
        }

        return status;
    }
    public static int insertmembership(memberBEAN u) {
        int status = 0;
        String a=u.getDate();
        System.out.println(a);
        String sql = "update members set validtill= ?, mem='yes' where username= ?";
        try {
            conn = ConnectionProvider.getCon();
            pst = conn.prepareStatement(sql);
            pst.setString(1, u.getDate());
            pst.setString(2, u.getUsername());
            status = pst.executeUpdate();
            System.out.println(sql);
            conn.close();
        } catch (Exception ex) {
            System.out.println(ex);
        }

        return status;
    }
    public static int updatemember(memberBEAN u) {
        int status = 0;
        String sql = "";
        try {

            conn=ConnectionProvider.getCon();

            String name=u.getName();
            String add=u.getAdd();
            String num=u.getPhno();
            String mail=u.getMail();
            String  pass=u.getPwd();
            ArrayList<Object> params = new ArrayList<>();
            boolean added = false;
            String query = "update members set ";
            if(name != null) {
                query += "name = ?";
                params.add(name);
                added = true;
            }
            if(add != null) {
                if (added) query +=",";
                query += "add = ?";
                params.add(add);
                added = true;
            }
            if(num != null) {
                if (added) query +=",";
                query += "phonenumber = ?";
                params.add(num);
                added = true;
            }
            if(mail != null) {
                if (added) query +=",";
                query += "mail = ?";
                params.add(mail);
                added = true;
            }
            if(pass !=null) {
                if (added) query +=",";
                query += " pwd=?";
                params.add(pass);
                added = true;
            }
            if (!added) {
                conn.close();
                return -1;
            }
            query +=" where username=?";
            System.out.println(query);
            params.add(u.getUsername());
            pst = conn.prepareStatement(query);
            for (int i = 0; i < params.size(); ++i) {
                Object o = params.get(i);
                if (o instanceof String) pst.setString(i+1, (String)o);
                else pst.setInt(i+1, (Integer)o);
            }
            System.out.println(query);
            status = pst.executeUpdate();
            conn.close();


        } catch (Exception ex) {
            System.out.println(ex);
        }

        return status;
    }
}
