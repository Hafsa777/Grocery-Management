<%-- 
    Document   : reorderNotification
    Created on : Sep 1, 2018, 10:38:48 PM
    Author     : user
--%>
<%@page import="java.sql.*;"%>
<%Class.forName("com.mysql.jdbc.Driver");%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        <%!
        public class viewDetails{
             String url = "jdbc:mysql://localhost:3306/grocery";
             String username = "root";
                String password = "sharana";

            Connection connection =null;
            PreparedStatement selectEmployee=null;
            ResultSet resultSet=null;

            public viewDetails(){
            
            try{
                connection=DriverManager.getConnection(url, username, password);

                selectEmployee=connection.prepareStatement("Select pid,name,quantity from grocery.product where quantity>10");
             }
             catch(SQLException e){
                e.printStackTrace();
             }
        }
        public ResultSet setView(){
        
        try{
            
            resultSet = selectEmployee.executeQuery();
        }
        catch(SQLException e){

             e.printStackTrace();
           }

    return resultSet;
    }
        }
        
        %>
        <%        
           
            viewDetails details=new viewDetails();
            ResultSet view = details.setView();
        %>
        
        
           
            
        <table border="0">
            
            <tbody>
                
            

                <%
                    while(view.next()){ %>
                <tr>
                    <td><%= view.getString("pid")%></td>
                    <td><%= view.getString("name")%></td>
                    
                    
                    <td><%= view.getString("quantity")%></td>
                    
                    
                </tr>
                <% } %>
                
                </tbody>
        </table>
            

    </body>
</html>
