
package dataAccessObject;
import DbConnect.DbConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import model.TimeStamp;
import model.UserAccountInfo;

/**
 *This class is to create DAO for user
 * @author Hanwei Cheng
 */

public class UserDao {
    private Connection connection;
    Statement st = null;
    ResultSet rs = null;
    String sql = "";
    
     public UserDao() {
        //connect to database and select the record
        connection = DbConnection.getConnection();
        System.out.println("==UserDao connection==");
    }
    
    //create account by passing variable value from user instance
    public int createAccount(String firstName,String lastName, String emailAddress, int access_role_id){
        // create new timestamp and return id
        TimeStamp time = new TimeStamp();
        long timeStampsID = time.getTimeStampsID();
         
        try {
                sql = "INSERT INTO INFSCI2731.account_info(first_name, last_name, email_addr, timestamps_id, access_role_id) values (?, ?, ?, ?, ?)";
                PreparedStatement ps = connection.prepareStatement(sql, PreparedStatement.RETURN_GENERATED_KEYS);  
                // Parameters start with 1
                ps.setString(1, firstName);               
                ps.setString(2, lastName);               
                ps.setString(3, emailAddress);  
                ps.setLong(4, timeStampsID);
                ps.setInt(5,access_role_id);
                ps.executeUpdate();
                
                ResultSet rs = ps.getGeneratedKeys();
                if(rs.next()) {
                    int autoKey = rs.getInt(1);
                    return autoKey;
                } else
                    return -1;
                
        } catch (SQLException e) {
                e.printStackTrace();
            return -1;            
        }         
       
    }
    
    public UserAccountInfo retrieveUserInfo(int accountID){
        try {
                sql = "SELECT * from INFSCI2731.account_info WHERE id=" + accountID;  
                
                System.out.println("Account " + accountID);
                PreparedStatement ps = connection.prepareStatement(sql);
//              ps.setInt(1, accountID);     
               //System.out.println(ps);

                rs = ps.executeQuery(sql);
                String firstName = "";
                String lastName = "";
                String emailAddress = "";
                int accessRole = 0;
                
                
                while(rs.next()) {
                    //Retrieve by column name
                    int id = rs.getInt("id");
                    firstName = rs.getString("first_name");
                    lastName = rs.getString("last_name");
                    emailAddress = rs.getString("email_addr");
                    accessRole = rs.getInt("access_role_id");
                }
                UserAccountInfo user = new UserAccountInfo();
                    user.setFirstName(firstName);
                    user.setLastName(lastName);
                    user.setEmailAddress(emailAddress);
                    user.setAccess_role_id(accessRole);
                System.out.println("==retrieved user info: " + firstName + lastName + emailAddress+ accessRole + "==");
                    return user;
                 
        } catch (SQLException e) {
                e.printStackTrace();
          return null;
        } 
    }
          
    
    //this method is to change the ID of role for user
    public boolean roleIDChange(int accountID, int roleID){
        try {
                sql = "UPDATE INFSCI2731.account_info SET access_role_id = ? WHERE id = ?";  
        
                System.out.println("Account: " + accountID);
                System.out.println("required role id:" + roleID);
                PreparedStatement ps = connection.prepareStatement(sql);
                ps.setInt(1, roleID);
                ps.setInt(2, accountID);
                ps.executeUpdate();
                return true;
                
        } catch (SQLException e) {
                e.printStackTrace();
          return false;
        } 
    }
        
}

