/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;
import java.sql.*;
/**
 *
 * @author rofl
 */
public class DBFunction {
    static final String MYSQL_DRIVER = "com.mysql.jdbc.Driver";
    static final String DB_URL = "jdbc:mysql://210.245.85.214:3306/news";
    static final String dbUser = "admin";
    static final String dbPw = "password";
    Connection conn = null;
    public DBFunction() {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection(DB_URL, dbUser, dbPw);
        } catch (Exception e) {
            e.printStackTrace();
        }
        
    }
    public int addCategory(String name, int author) {
        int rows = 0;
        try {
            PreparedStatement pstm = conn.prepareStatement("insert into category(name, user_id) value(?, ?)");
            pstm.setString(1, name);
            pstm.setInt(2, author);
            rows = pstm.executeUpdate();
            conn.commit();
            conn.close();
            pstm.close();
        } catch(Exception e) {
            e.printStackTrace();
        }
        return rows;
    }
}
