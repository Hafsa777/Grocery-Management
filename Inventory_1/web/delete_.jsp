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
       
        
        <title>Delete Product</title>
    </head>
    <body onLoad="displayResults()">
           
            
        <%!
              public class Item{
                    
                        
                        String URL = "jdbc:mysql://localhost:3306/grocery";
                        String USERNAME = "root";
                        String PASSWORD = "sharana";
                
                        Connection conn = null;

                        PreparedStatement selectProduct = null;
                        PreparedStatement deleteProduct =null;
                        
                        ResultSet resultSet = null;  
                         
                        String query;
                       

                 public Item(){
                    try{
                        conn = DriverManager.getConnection(URL,USERNAME,PASSWORD);
                        
                        selectProduct=conn.prepareStatement("select pid,name from grocery.product");
                        deleteProduct=conn.prepareStatement("delete from grocery.product where pid=?");
                       
                        //pre = conn.prepareStatement(query);
                       
                     }catch(SQLException e){

                        e.printStackTrace();
                }
                }

                public ResultSet getItem(){

                try{
                    resultSet=selectProduct.executeQuery();
                }catch(SQLException e){
                    
                    e.printStackTrace();
                }
                    return resultSet;
            }
            public int deleteItem(Integer pid){
            
                int result = 0;


                try{
                    deleteProduct.setInt(1,pid);
                    result=deleteProduct.executeUpdate();

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
          
          Integer pId=new Integer(0);
          
          if(request.getParameter("submit")!=null){
              pId=Integer.parseInt(request.getParameter("item"));
              result1=item.deleteItem(pId);
              
          }
          %>
          
              
              
             
                   <form name="deleteForm" action="delete_.jsp" method="POST">
            
                <tbody>
                    <tr>
                        <td>product name</td>
                    </tr>
                    <tr>
                                <td><select name="product">
                                        <%
                                            while(items.next()){
                                             %>
                                             <option value="<%=items.getString("pid")%>"><%=items.getString("name")%></option>
                                        <%}%>
                            </select></td>
                    </tr>
                    
                </tbody>
            </table>
            <input type="hidden" name="hidden" value="<%= result1 %>"/>
        
            <input type="submit" value="delete" name="Delete"/>

        </form>
    <SCRIPT LANGUAGE="JavaScript">
        function displayResults(){
            if(document.deleteForm.hidden.value==1){
                alert("DATA DELETED...!");
            }
        }
        </SCRIPT>

              
    </body>
</html>
