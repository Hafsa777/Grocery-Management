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
        <%--  <% if(session.getAttribute("user_name")!=null){ %> --%>
        
  <%! 
          
        public class order{
        
            String url="jdbc:mysql://localhost:3306/grocery";
            String username="root";
            String password = "sharana";
            
            Connection conn = null;
            PreparedStatement pre = null;
            ResultSet result = null;  
            String query;
            
            public order(){
            try{
                
                conn = DriverManager.getConnection(url,username,password);
                query = "select c.addressLine1 ,c.addressLine2 ,c.email ,c.phoneNo,o.oid,o.date,o.item,o.price,o.quantity from login l ,customer c ,order_retail o where l.cid = c.cid and c.cid = o.cid ";
                pre =conn.prepareStatement(query);
                
                 }catch(SQLException e){
                e.printStackTrace();
            }
                        
            }
            
            public ResultSet getNames(){
                try{
                    result = pre.executeQuery();
   
            }catch(SQLException e){
                e.printStackTrace();
            }
               return result;
            }            
            
          }
        
        %>
        
        <% 

            String name = new String();
            
            order o1 =new order();
            ResultSet ca = o1.getNames();
            
        %>
        
        <h3 id="head"> Your order is Confirmed!!! </h3>
        <div id="invoice">Invoice</div>
        
        <% while(ca.next()) { %>

        <div id="id"> 
            <%= ca.getString("oid")%>
        </div>
        <div id="address">Billed To
             <%= ca.getString("addressLine1")%>
             <%= ca.getString("addressLine2")%>
             <%= ca.getString("email")%>
        </div>
        <div id ="date">Order date
             <%= ca.getDate("date")%>
        </div>
        <table border="1" width="5" cellspacing="6" cellpadding="4">
            <caption>
                Order Summary
            </caption>
            <thead>
           
                <tr>
                    <th>Item</th>
                   <th>Price</th>
                   <th>Quantity</th>
                   <th>Total</th>
                </tr>
            </thead>
            <tbody>
               
                <tr>    
                    <td><%= ca.getString("item")%></td>
                    <td><%= ca.getDouble("price")%></td>
                    <td><%= ca.getInt("quantity")%></td>
                   
                </tr>
               <%} %>
            </tbody>
        </table>
        
         <%---- <% }
        else
        {
            response.sendRedirect("login.jsp?id= You have to login first to continue");
        }
      %>--%>
        
         
    </body>
</html>