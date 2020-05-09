<%-- 
    Document   : restock
    Created on : Aug 30, 2018, 7:45:27 PM
    Author     : User
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
              public class update{
                    
                        
                        String URL = "jdbc:mysql://localhost:3306/payroll";
                        String USERNAME = "root";
                        String PASSWORD = "sharana";
                
                        Connection conn = null;
                        PreparedStatement pre = null;
                        ResultSet result = null;  
                        String query;
                        
                        
                 public update(){
                    try{
                        conn = DriverManager.getConnection(URL,USERNAME,PASSWORD);
                        query = "update grocery.product set quantity=quantity+?"
                                + "where pid=?";
                         pre = conn.prepareStatement(query);

                     }catch(SQLException e){

                        e.printStackTrace();
                }
                }

                public int setNames(String quantity,String pid){

                    int result = 0;

                try{
                        //pre.setString(1, name);
                        
                        pre.setString(1,quantity);
                       
                         pre.setString(2, pid);
                        
                        result = pre.executeUpdate();                       

                  }catch(SQLException e){

                    e.printStackTrace();;
                    
                }
                    return result;
            }

}
        %>
        <%
                int result = 0;
                
                String pid = new String();
                //String name = new String();
                
                String quantity = new String();
               
                if(request.getParameter("submit") != null){
                
                    //if(request.getParameter("name")!= null){
                        //name = request.getParameter("name");
                    //}
                     
                   
                      if(request.getParameter("quantity")!= null){
                       quantity = request.getParameter("quantity");
                    }
                     
                      
                      
                     if(request.getParameter("pid")!= null){
                        pid = request.getParameter("pid");
                    }
                     
                
                }
                
                update lg = new update();
                result = lg.setNames(quantity,pid);
        
        %>
        
        <script type="text/javascript">
                            function validate(){
                                
                                if(document.updateProduct.pid.value == ""){
                                     alert("Enter Product ID!");
                                     document.updateProduct.pid.focus();
                                     return false;
                                }
                                
                                //if(document.updateProduct.name.value == ""){
                                   //  alert("Enter Product Name!");
                                   //  document.updateProduct.name.focus();
                                   //  return false;
                                //}
                               
                                
                                
                               if(document.updateProduct.quantity.value == ""){
                                     alert("Enter Quantity!");
                                     document.updateProduct.quantity.focus();
                                     return false;
                                }
                               
                                
                                
                               
                               return true;
                           }
                           </script>

        
        <form name="updateProduct" action="restock.jsp" method="POST" onsubmit="return validate()">
            <table border="0"  cellspacing="8" cellpadding="8">
              
                <tbody>
                    <tr>
                        <td>Product ID:</td>
                        <td><input type="text" name="pid" value=""  /></td>
                    </tr>     
                    <tr>    
                        <td>Product Name:</td>
                        <td><input type="text" name="name" value=""  /></td>
                    </tr>
                  
                    <tr>
                        <td>Quantity: </td>
                        <td><input type="text" name="quantity" value=""  /></td>
                    </tr>
                    
                    
                        
                        <td><input type="reset" value="reset" name="reset" /></td>
                        <td><input type="submit" value="update" name="submit" /></td>
                      
                    </tr>
                </tbody>
            </table>

        </form>
                           
                           <% if(result == 1){ %>
        
                        <SCRIPT LANGUAGE="JavaScript">
                          
                                alert("Data Updated!");
                                document.location ="restock.jsp";
                      
                        </SCRIPT>
                        <% } %>
        
    </body>
</html>
