<%@page import="java.sql.*"%>
<%Class.forName("com.mysql.jdbc.Driver");%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View Product</title>
    </head>
    <body>
        <h1></h1>
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

                selectEmployee=connection.prepareStatement("Select * from grocery.product ");
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
                <tr>
                    <td><b>Product ID</b></td>
                    <td><b>Product Name</b> </td>
                    <td><b>Category</b></td>
                    <td><b>Description</b></td>
                    <td><b>Selling Price</b></td>
                    <td><b>Buying Price</b></td>
                    <td><b>Quantity</b></td>
                    <td><b>Weight</b></td>
                    
 
                   
                </tr>
                <%
                    while(view.next()){ %>
                    <tr><b>
                        <td><%= view.getString("pid")%></td>
                    <td><%= view.getString("name")%></td>
                    <td><%= view.getString("ptype")%></td>
                    <td><%= view.getString("description")%></td>
                    <td><%= view.getString("sellPrice")%></td>
                    <td><%= view.getString("buyPrice")%></td>
                    <td><%= view.getString("quantity")%></td>
                    <td><%= view.getString("weight")%></td>
                    
                    </tr></b>
                <% } %>
            </tbody>
        </table>

       
    </body>
</html>
