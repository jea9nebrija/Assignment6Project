/*************************************************
 File: HomePage.java
 By: Jeanine Nebrija
 Date: 5/20/24
 Compile: Open directory as IntelliJ project, compile and run.
 System: Windows w/ Java
 Description: Allows you to click home page/main page
 *************************************************/

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Assignment6View;

import Assignment6Controller.CustomerDAO;
import Assignment6Model.BankCustomer;

import javax.swing.*;
import java.awt.*;
import java.awt.event.*;
import java.sql.SQLException;
import java.util.List;

/**
 *
 * @author karunmehta
 */
public class HomePage extends JFrame implements ActionListener {
    
    JButton jbShowAll, jbSearch, jbAdd, jbRemove, jbUpdate;
    
    HomePage() {
    
        setLayout(null);
        
        //create icon you want on the frame
        ImageIcon iIcon = new ImageIcon(ClassLoader.getSystemResource("icons/customer.jpg"));
        Image anImage = iIcon.getImage().getScaledInstance(1000, 630, Image.SCALE_DEFAULT);
        ImageIcon iIcon2 = new ImageIcon(anImage);
        JLabel theLabel = new JLabel(iIcon2);
        theLabel.setBounds(0, 0, 1100,630);
        add(theLabel);
        
        JLabel heading = new JLabel("Application Main Menu");
        heading.setBounds(100, 100, 400,40);
        heading.setFont(new Font("Tahoma", Font.BOLD, 25));
        theLabel.add(heading);
        
        jbShowAll = new JButton("Show All Customers");
        jbShowAll.setBounds(100, 200, 200,40);
        jbShowAll.addActionListener(this);
        theLabel.add(jbShowAll);

        jbSearch = new JButton("Search Customer(s)");
        jbSearch.setBounds(100, 250, 200,40);
        jbSearch.addActionListener(this);
        theLabel.add(jbSearch);
        
        jbAdd = new JButton("Add New Customer");
        jbAdd.setBounds(100, 300, 200,40);
        jbAdd.addActionListener(this);
        theLabel.add(jbAdd);
        jbAdd.setVisible(false);
                
        setSize(1120, 630);
        setLocation(250, 100);
        setVisible(true);
    
    }
    
    public void actionPerformed(ActionEvent ae) {
        if((ae.getSource()) == jbAdd) { 
            new CustomerFrame();
        } else if((ae.getSource()) == jbSearch) {
            new CustomerSearch();
        } else if((ae.getSource()) == jbShowAll) {
            CustomerDAO cd=new CustomerDAO();
            List<BankCustomer> results;
            try {results=cd.listAll();}
            catch (SQLException e) {throw new RuntimeException(e);}
            new CustomerList(results);
        }
    }
    
    //This main method is not needed, unless you want to run this class by itself from your IDE to validate its look'n feel
    //This frame(window) will be called as a result of an action(click, select etc) from another widget on on another winhow during the GUI workflow
    public static void main(String[] args) {

        new HomePage();

    }
    
}
