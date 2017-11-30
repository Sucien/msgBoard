package cs.cwnu.dao;

import cs.cwnu.bean.Line;
import cs.cwnu.bean.Message;
import cs.cwnu.bean.User;
import cs.cwnu.db.DBconn;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class UserDao {
    Connection conn = DBconn.getConn();//数据库连接对象
    /*PreparedStatement是java.sql包下面的一个接口，用来执行SQL语句查询（参数化查询），
      通过调用connection.preparedStatement(sql)方法可以获得PreparedStatment对象。*/
    PreparedStatement pstmt;


    //向User类里面写数据库的内容
    public User checkLogin(String name){
        try{
            pstmt = conn.prepareStatement("SELECT * FROM users WHERE name=?");
            pstmt.setString(1,name);

            ResultSet rs = pstmt.executeQuery();

            if(rs.next()){
                User user = new User();

                user.setId(rs.getInt(1));
                user.setName(rs.getString(2));
                user.setPassword(rs.getString(3));
                user.setRole(rs.getInt(4));
                return user;
            }
            return null;
        }catch (Exception e){
            e.printStackTrace();
            return null;
        }
    }

    public ArrayList<Message> findMbInfo(int page){
        try{
            ArrayList<Message> al = new ArrayList<Message>();

            pstmt = conn.prepareStatement("SELECT * FROM messages limit ?,10");
            pstmt.setInt(1,page);
            ResultSet rs = pstmt.executeQuery();

            while (rs.next()){
                Message message = new Message();

                message.setId(rs.getInt(1));
                message.setName(rs.getString(2));
                message.setTime(rs.getDate(3));
                message.setTitle(rs.getString(4));
                message.setMessage(rs.getString(5));
                al.add(message);
            }
            return al;
        }catch (Exception e){
            e.printStackTrace();
            return null;
        }
    }

    public int getMaxPage(){
        int max = -1;
        try {
            pstmt = conn.prepareStatement("SELECT count(*) FROM messages ");

            ResultSet rs = pstmt.executeQuery();
            while (rs.next()){
                max = rs.getInt(1);
            }
            return max;

        }catch (Exception e){
            e.printStackTrace();
            return -1;
        }
    }

    public String getName(int id){
        String name = null;

        try{
            pstmt = conn.prepareStatement("SELECT name FROM users WHERE id=?");
            pstmt.setInt(1,id);
            ResultSet rs = pstmt.executeQuery();

            while (rs.next()){
                name = rs.getString(1);
            }
            return name;
        }catch (Exception e){
            e.printStackTrace();
            return null;
        }
    }

    public int getUserRole(String name){

        int role = -1;

        try{
            pstmt = conn.prepareStatement("SELECT role FROM users WHERE name=?");
            pstmt.setString(1,name);
            ResultSet rs = pstmt.executeQuery();

            while (rs.next()){
                role = rs.getInt(1);
            }
            return role;
        }catch (Exception e){
            e.printStackTrace();
            return 0;
        }
    }

    public boolean addInfo(Message message){
        try{
            pstmt = conn.prepareStatement("INSERT INTO messages VALUES(?,?,?,?,?)");
            pstmt.setInt(1,message.getId());
            pstmt.setString(2,message.getName());
            pstmt.setDate(3,message.getTime());
            pstmt.setString(4,message.getTitle());
            pstmt.setString(5,message.getMessage());
            pstmt.executeUpdate();
            return true;
        }catch (Exception e){
            e.printStackTrace();
            return false;
        }
    }


    public boolean delInfo(int id){
        try{
            pstmt = conn.prepareStatement("DELETE FROM messages WHERE id=?");
            pstmt.setInt(1,id);

            pstmt.executeUpdate();
            return true;
        }catch (Exception e){
            e.printStackTrace();
            return false;
        }
    }

    public boolean overInfo(int id,String title,String message){
        try{
            pstmt = conn.prepareStatement("UPDATE messages SET title=?,mesage=? WHERE id=?");
            pstmt.setString(1,title);
            pstmt.setString(2,message);
            pstmt.setInt(3,id);

            pstmt.executeUpdate();
            return true;
        }catch (Exception e){
            e.printStackTrace();
            return false;
        }
    }


    //插入用户数据、创建用户数据
    public boolean insertUser(String name,String password,int role) {
        try {
            pstmt = conn.prepareStatement("INSERT INTO users(name,password,role,status) VALUES(?,?,?,?)");
            pstmt.setString(1, name);
            pstmt.setString(2, password);
            pstmt.setInt(3, role);
            pstmt.setInt(4,1);

            pstmt.executeUpdate();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

        public boolean setStatusBan(String name){
            try{
                pstmt = conn.prepareStatement("UPDATE users SET status=? WHERE name=?");
                pstmt.setInt(1,2);
                pstmt.setString(2,name);

                pstmt.executeUpdate();
                return true;
            }catch (Exception e){
                e.printStackTrace();
                return false;
            }
        }

    public boolean setStatusAsking(String name){
        try{
            pstmt = conn.prepareStatement("UPDATE users SET status=? WHERE name=?");
            pstmt.setInt(1,0);
            pstmt.setString(2,name);

            pstmt.executeUpdate();
            return true;
        }catch (Exception e){
            e.printStackTrace();
            return false;
        }
    }

    public boolean setStatusActivated(String name){
        try{
            pstmt = conn.prepareStatement("UPDATE users SET status=? WHERE name=?");
            pstmt.setInt(1,1);
            pstmt.setString(2,name);

            pstmt.executeUpdate();

            return true;
        }catch (Exception e){
            e.printStackTrace();
            return false;
        }
    }

    public int getUserStatus(String name){

        int status = -1;

        try{
            pstmt = conn.prepareStatement("SELECT status FROM users WHERE name=?");
            pstmt.setString(1,name);
            ResultSet rs = pstmt.executeQuery();

            while (rs.next()){
                status = rs.getInt(1);
            }
            return status;
        }catch (Exception e){
            e.printStackTrace();
            return 0;
        }
    }

    public ArrayList<Line> isLine(){
        ArrayList<Line> name = new ArrayList<Line>();
        try {
            pstmt = conn.prepareStatement("SELECT name FROM isline");
            ResultSet rs = pstmt.executeQuery();

            while (rs.next()){
                Line line = new Line();
                line.setName(rs.getString(1));
                name.add(line);
            }
            return name;
        }catch (Exception e){
            e.printStackTrace();
            return null;
        }
    }

    public boolean InsertLine(String name){
        try {
            pstmt = conn.prepareStatement("INSERT INTO isline(id,name,line) VALUES(?,?,?)");
            pstmt.setInt(1, 1);
            pstmt.setString(2, name);
            pstmt.setInt(3, 1);

            pstmt.executeUpdate();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean delLine(String name){
        try{
            pstmt = conn.prepareStatement("DELETE FROM isline WHERE name=?");
            pstmt.setString(1,name);

            pstmt.executeUpdate();
            return true;
        }catch (Exception e){
            e.printStackTrace();
            return false;
        }
    }


}
