package cs.cwnu.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBconn {
    public static Connection conn; //Connection对象（连接）


    public static Connection getConn(){
        try{

            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/msgdb?characterEncoding=utf-8&useSSL=true","root","960406");
            return conn;

        }catch (SQLException e) {
            System.out.println("数据库连接失败...");
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        return null;
    }

    public static void CloseConn(){
        try{
            conn.close();
        }catch (Exception e){
            e.printStackTrace();
        }
    }


}
