<%@page import="java.sql.*;"%>
<%@page import="java.util.Date" %>
<%Class.forName("com.mysql.jdbc.Driver");%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>

        
         <% if (session.getAttribute("user_name") != null) { %>
        <img src="gf.jpeg">
        <strong><% out.println("Welcome " + session.getAttribute("user_name"));%></strong>
        
  <%! 
        public class retailOrder{
        
                String url ="jdbc:mysql://localhost:3306/grocery";
                String username = "root";
                String password = "sharana";
                
                PreparedStatement pre = null;
                ResultSet result=null;
                PreparedStatement prep = null;
                PreparedStatement pr = null;
                PreparedStatement p = null;
                
                String query;
                String query1;
                String query2;
                String query3;
                String query4;
               
                
                Connection con = null;
                
            public retailOrder(){
                try{
                con = DriverManager.getConnection(url, username, password);
                
                query4 = "insert into order_retail(item,quantity,price,total,date,pid,cid) values(?,?,?,?,?,?,?)";
                query1 = "update product set  quantity=quantity - ?   where pid=?";
                query2 = "update product set sellQuantity=sellQuantity + ? where pid=?";
                query = "select c.addressLine1 ,c.addressLine2 ,c.email ,c.phoneNo,o.oid,o.date,o.item,o.quantity,o.total from login l ,customer c ,order_retail o where l.cid = c.cid and c.cid = o.cid  and l.username=?";
               
                prep = con.prepareStatement(query4);
                pr = con.prepareStatement(query1);
                p = con.prepareStatement(query2);
                pre = con.prepareStatement(query);
                
        }catch(SQLException e){
                e.printStackTrace();
        }
            }
              public int setODetails(String item,String quan,String price,String total,Timestamp date,String pid,String cid){
                int result = 0;
                try{
                
                     prep.setString(1, item);
                     prep.setString(2, quan);
                     prep.setString(3, price);
                     prep.setString(4, total);
                     prep.setTimestamp(5, date);
                     prep.setString(6, pid);
                      prep.setString(7, cid);
                    result = prep.executeUpdate();
                
                }catch(SQLException e){
                    e.printStackTrace();
                
                }
                return result;
            }
               public int enterDetails(String quan,String item){
                int result1 = 0;
                try{
                
                     pr.setString(1, quan);
                     pr.setString(2, item);
                     
                    result1 = pr.executeUpdate();
                
                }catch(SQLException e){
                    e.printStackTrace();
                
                }
                return result1;
            }
             
            public int updateDetails(String quan,String item){
                int result = 0;
                try{
                
                     p.setString(1,quan);
                     p.setString(2, item);
                    result = p.executeUpdate();
                
                }catch(SQLException e){
                    e.printStackTrace();
                
                }
                return result;
           }
            
       
            public ResultSet setDetails(String name){
               
                try{
                
                     pre.setString(1, name);
                    result = pre.executeQuery();
                
                }catch(SQLException e){
                    e.printStackTrace();
                
                }
                return result;
            }
            
            
        }
           
  
  %>
    
  
  <% 
      
        int result1 =0;
        int result = 0;
        int result2 =0;
        
        Date d1 = new Date();
        Timestamp time =  new Timestamp(d1.getTime()); 
       
             String cid = session.getAttribute("user_name").toString();    
             String id = request.getParameter("pid");
             String item  = request.getParameter("item"); 
             String quan =request.getParameter("quan"); 
             String price = request.getParameter("price");
             String total = request.getParameter("total"); 
             String username = session.getAttribute("user_name").toString();
        
         
        retailOrder o1 = new retailOrder();
        result = o1.setODetails(item, quan, price, total, time,id,cid);
        result1  = o1.enterDetails(quan,id);
        result2 = o1.updateDetails(quan,id); 
         ResultSet ca = o1.setDetails(username);
        
      
      
 
             
            
            
        
      
        
  %>
     <h3 id="head"> Your order is Confirmed!!! </h3>
        <div id="invoice">Invoice</div>
        
        <% while(ca.next()) { %>

        <div id="id"> 
            <%= ca.getString("oid")%>
        </div>
        <div id="address">Billed To
             <%= ca.getString("addressLine1")%>
              <%= ca.getString("addressline2")%>
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
                    <td><%= ca.getInt("quantity")%></td>
                    <td><%= ca.getDouble("total")%></td>
                </tr>
               <%} %>
            </tbody>
        </table>
        
  
  
     <% } else {
                response.sendRedirect("login.jsp?id=Your session may be expired. You have to login first");
            }
        %>
  
        
        
    </body>
</html>