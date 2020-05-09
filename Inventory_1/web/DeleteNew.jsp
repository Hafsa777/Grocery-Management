<%-- 
    Document   : delete_product
    Created on : Aug 2, 2018, 9:31:07 PM
    Author     : USER
--%>
<%@page import="java.sql.*;"%>
<%Class.forName("com.mysql.jdbc.Driver");%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" media="screen,projection" type="text/css" href="./main.css" />
        
        <title>Delete Product</title>
    </head>
    <body>
                
        
           
            
        <%!
              public class Item{
                    
                        
                        String URL = "jdbc:mysql://localhost:3306/grocery";
                        String USERNAME = "root";
                        String PASSWORD = "sharana";
                
                        Connection conn = null;

                        PreparedStatement pre = null;
                        PreparedStatement pre1=null;
                        
                        ResultSet ResultSet = null;  
                         
                        String query;
                       

                 public Item(){
                    try{
                        conn = DriverManager.getConnection(URL,USERNAME,PASSWORD);
                        
                        pre=conn.prepareStatement("select * from grocery.product");
                        pre1=conn.prepareStatement("delete from grocery.product where pid=?");
                       
                        //pre = conn.prepareStatement(query);
                       
                     }catch(SQLException e){

                        e.printStackTrace();
                }
                }

                public ResultSet getItem(){

                try{
                    ResultSet=pre.executeQuery();
                }catch(SQLException e){
                    
                    e.printStackTrace();
                }
                    return ResultSet;
            }
            public int deleteItem(Integer pid){
            
                int result = 0;


                try{
                    pre1.setInt(1,pid);
                    result=pre1.executeUpdate();

                }catch(SQLException e){
                    e.printStackTrace();
                }
                return result;
        }
               
    }
      %>
      <%
          int result1=0;
          Item item=new Item();
          ResultSet items = item.getItem();
          
          Integer pid=new Integer(0);
          
          if(request.getParameter("submit")!=null){
              pid=Integer.parseInt(request.getParameter("item"));
              result1=item.deleteItem(pid);
              
          }
          %>
         
              
            
                
              
            
                   <form action="delete.jsp" method="POST">
            
                <tbody>
                    <tr>
                        <td>product ID</td>
                    </tr>
                    <tr>
                                <td><select name="product">
                                        <%
                                            while(items.next()){
                                             %>
                                             <option value"<%=items.getInt("pid")%>"><%=items.getString("name")%></option>
                                        <%}%>
                            </select></td>
                    </tr>
                    
                </tbody>
            </table>
        
            <input type="submit" value="delete" name="Delete"/>

        </form>

              
              
       
                        
    </body>
</html>
