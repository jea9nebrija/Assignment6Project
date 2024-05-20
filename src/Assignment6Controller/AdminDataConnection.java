/*************************************************
 File: AdminDataConnection.java
 By: Jeanine Nebrija
 Date: 5/20/24
 Compile: Open directory as IntelliJ project, compile and run.
 System: Windows w/ Java
 Description: Initializing admin data connection on SQL
 *************************************************/

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Assignment6Controller;

/**
 *
 * @author karunmehta
 */
public class AdminDataConnection {
    
    // SQL queries for Admin object
    private static final String SELECT_ADMIN = "SELECT * FROM admin WHERE userid = ?";
 
    public AdminDataConnection()  { } 
    
    
    public static String getSelect() {
        
        return SELECT_ADMIN;
    }

    
}
