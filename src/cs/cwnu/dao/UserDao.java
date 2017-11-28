package cs.cwnu.dao;

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
            pstmt = conn.prepareStatement("SELECT * FROM users WHERE name=?"+"AND password=?");
            pstmt.setString(1,name);
            pstmt.setString(2,name);

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

    public ArrayList<Message> findMbInfo(){
        try{
            ArrayList<Message> al = new ArrayList<Message>();

            pstmt = conn.prepareStatement("SELECT * FROM messages");
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


    //插入用户数据
    public boolean insertUser(String name,String password){
        try{
            pstmt = conn.prepareStatement("INSERT INTO users(name,password) VALUES(?,?)");
            pstmt.setString(1,name);
            pstmt.setString(2,password);

            pstmt.executeUpdate();
            return true;
        }catch (Exception e){
            e.printStackTrace();
            return false;
        }
    }

}
