/*************************************************
 File: DAOInterface.java
 By: Jeanine Nebrija
 Date: 5/20/24
 Compile: Open directory as IntelliJ project, compile and run.
 System: Windows w/ Java
 Description: Interface of DAO
 *************************************************/

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package Assignment6Controller;

import java.sql.SQLException;
import java.util.List;

/**
 *
 * @author karunmehta
 */
public interface DAOInterface<T> {
    
    T get(int id) throws SQLException;
    //List<T> getAll() throws SQLException;
    int create(T e) throws SQLException;
    int update(T e) throws SQLException;
    int delete(T e) throws SQLException;
    
}
