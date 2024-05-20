/*************************************************
 File: AccountDTO.java
 By: Jeanine Nebrija
 Date: 5/20/24
 Compile: Open directory as IntelliJ project, compile and run.
 System: Windows w/ Java
 Description: Implements account data transfer object (DTO)
 *************************************************/


/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Assignment6Controller;

import java.util.*;

public class AccountDTO {

    private int id;
    private String username;
    private String email;
    private String phone;
    private List address;

    static AccountDAO cd = new AccountDAO();

    //default custructor
    public AccountDTO() {


    }

}