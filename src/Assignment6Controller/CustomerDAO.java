/*************************************************
 File: CustomerDAO.java
 By: Jeanine Nebrija
 Date: 5/20/24
 Compile: Open directory as IntelliJ project, compile and run.
 System: Windows w/ Java
 Description: Initializing customer data access object (DAO)
 *************************************************/

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Assignment6Controller;

import Assignment6Controller.*;
import Assignment6Model.*;
import java.sql.*;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import javax.swing.JOptionPane;

/**
 *
 * @author karunmehta
 */

public class CustomerDAO implements DAOInterface<BankCustomer> {

    static Connection connection = null;
    PreparedStatement pStatement;
    ResultSet result;
    
    public CustomerDAO() {
            connection = DataConnection.getDBConnection();
    }
       
    
    // Method to disconnect from the database
    public static void disconnect() throws SQLException {
        if (connection != null && !connection.isClosed()) {
            connection.close();
        }
    }

    // Method to insert a user into the database
    @Override
    public int create(BankCustomer cust) throws SQLException {
        
        int res = -1;
        pStatement = connection.prepareStatement(CustomerDataConnection.getInsert());
        pStatement.setString(1, cust.getFirstName());
        pStatement.setString(2, cust.getLastName());
        pStatement.setString(3, cust.getEmail());
        pStatement.setString(4, cust.getPhone());
        pStatement.setString(5, cust.getBirthday());
        res = pStatement.executeUpdate();
        disconnect();
        
        return res;
    }

    // Method to retrieve a user from the database by ID
    @Override
    public BankCustomer get(int anID) throws SQLException {

        pStatement = connection.prepareStatement(CustomerDataConnection.getSelect());
        pStatement.setInt(1,anID);
        result = pStatement.executeQuery();
        
        BankCustomer updatedCust = null;
        if (result.next()) {
            updatedCust = new BankCustomer( result.getInt("id"), result.getString("first_name"), result.getString("last_name"));
            updatedCust.setEmail(result.getString("email"));
            updatedCust.setEmail(result.getString("phone"));
        }


        
        return updatedCust;
    }

    // Method to search for Customers by city
    public List<BankCustomer> findCustomer(String city) throws SQLException {
        pStatement = connection.prepareStatement(CustomerDataConnection.getSearch());
        pStatement.setString(1,city);
        result = pStatement.executeQuery();
        List<BankCustomer> output=new ArrayList<>();
        while(result.next()) {output.add(initializeBankCustomer(result));}
        return output;
    }
    // Method to list all customers from database
    public List<BankCustomer> listAll() throws SQLException {
        pStatement = connection.prepareStatement(CustomerDataConnection.getSelectAll());
        result = pStatement.executeQuery();
        List<BankCustomer> output=new ArrayList<>();
        while(result.next()) {output.add(initializeBankCustomer(result));}
        return output;
    }

    public BankCustomer initializeBankCustomer(ResultSet r) throws SQLException {
        BankCustomer bc;
        bc = new BankCustomer( r.getInt("id"), r.getString("first_name"), r.getString("last_name"));
        bc.setEmail(r.getString("email"));
        bc.setPhone(r.getString("phone"));
        bc.setAddress(new CustomerAddress(
            r.getInt("id"),
            r.getInt("streetnum"),
            r.getString("streetname"),
            r.getString("city"),
            r.getString("state"),
            r.getInt("zip")
        ));
        return bc;
    }

    // Method to update a user in the database
    @Override
    public int update(BankCustomer cust) throws SQLException {
        
        int result = -1;
        
        pStatement = connection.prepareStatement(CustomerDataConnection.getUpdate());
        pStatement.setString(1, cust.getFirstName());
        pStatement.setString(1, cust.getLastName());

        pStatement.setString(2, cust.getEmail());
        pStatement.setString(3, cust.getPhone());
        pStatement.setInt(4, cust.getCustomerNumber());
        result = pStatement.executeUpdate();
        
        return result;
    }

    // Method to delete a user from the database
    @Override
    public int delete(BankCustomer cust) throws SQLException {
        
        int res = -1;
        
        pStatement = connection.prepareStatement(CustomerDataConnection.getDelete());
        pStatement.setInt(1, cust.getCustomerNumber());
        res = pStatement.executeUpdate();
        
        return res;
    }
    
    public HashMap validateLogin(String id) {
        
        HashMap hm = null;
        
        try {
            
            pStatement = connection.prepareStatement(CustomerDataConnection.getAdmin());
            pStatement.setString(1, id);
            result = pStatement.executeQuery();
            
            if (result.next()) {
                hm = new HashMap();
                hm.put("ID", result.getString("userid"));
                hm.put("PWD", result.getString("pwd"));
            }
            
        } catch( Exception e) {
            JOptionPane.showMessageDialog(null,e.getMessage() + " Try again..");
        }
        
        return hm;
    }
    
}
