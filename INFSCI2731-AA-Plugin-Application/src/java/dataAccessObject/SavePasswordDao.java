/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dataAccessObject;

import DbConnect.DbConnection;
import java.math.BigDecimal;
import java.math.BigInteger;
import java.security.SecureRandom;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author shaoNPC
 */
public class SavePasswordDao {
    private Connection connection;
    
    public SavePasswordDao(){
        connection = DbConnection.getConnection();
    }
    
    public boolean savePassword(int account_info_id, String password) {
        setOldPasswordInactive(account_info_id);
        deleteOldPasswords(account_info_id);
        return setNewPassword(account_info_id, password);
    }
    
    private boolean setNewPassword(int account_info_id, String password) {
        SecureRandom srnd = new SecureRandom();

        int salt = srnd.nextInt(90000000) + 10000000;
        
        AuthenticationDao auth = new AuthenticationDao();
        
        byte[] hash = auth.computeHash(password, String.valueOf(salt));
        
        TimeStampDao timeStampDao = new TimeStampDao();
        long timeStampsID = timeStampDao.setUpTimeStamp();
        
        try {
            connection = DbConnection.getConnection();
            String insertSQL = "INSERT INTO INFSCI2731.authentication(account_info_id, hash, password_salt, timestamps_id, active) values (?, ?, ?, ?, ?)";
            PreparedStatement preparedStatement = connection.prepareStatement(insertSQL);  
            preparedStatement.setInt(1, account_info_id);
            preparedStatement.setBytes(2, hash);
            preparedStatement.setInt(3, salt);
            preparedStatement.setLong(4, timeStampsID);
            preparedStatement.setInt(5, 1);
            
            preparedStatement.executeUpdate();
                
            ResultSet rs = preparedStatement.getGeneratedKeys();
            
            return rs.next();
            
        } catch (SQLException e) {
            
        }
            
        return false;
    }
    
    private void setOldPasswordInactive(int account_info_id) {
        try {
            connection = DbConnection.getConnection();
            String insertSQL = "UPDATE INFSCI2731.authentication set active = 0 where account_info_id = ?";
            PreparedStatement preparedStatement = connection.prepareStatement(insertSQL);  
            preparedStatement.setInt(1, account_info_id);
            
            preparedStatement.executeUpdate();
            
        } catch (SQLException e) {
            
        }
    }
    
    private void deleteOldPasswords(int account_info_id) {
        try {
            connection = DbConnection.getConnection();
            String deleteSQL =  "DELETE a FROM" +
                                " INFSCI2731.authentication as a" +
                                " JOIN" +
                                " (SELECT authentication.id, authentication.account_info_id " +
                                " FROM INFSCI2731.authentication" +
                                " WHERE authentication.account_info_id = ? AND authentication.active = 0 ORDER BY authentication.id DESC LIMIT 2, 1)" +
                                " as b" +
                                " ON a.id < b.id AND a.account_info_id = b.account_info_id";
            PreparedStatement preparedStatement = connection.prepareStatement(deleteSQL);  
            preparedStatement.setInt(1, account_info_id);
            
            preparedStatement.executeUpdate();
            
        } catch (SQLException e) {
            
        }
    }
    
}
