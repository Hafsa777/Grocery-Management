<%@page import="java.sql.*;"%>
<%@page import="java.util.Date" %>
<%Class.forName("com.mysql.jdbc.Driver");%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" media="screen,projection" type="text/css" href="cart.css" />
        
    </head>
   
    
    <body>
        
          
         <% if (session.getAttribute("user_name") != null) { %>
        <img src="gf.jpeg">
        <strong><% out.println("Welcome " + session.getAttribute("user_name"));%></strong>
        
        
        <%! 
        public class payment{
        
                String url ="jdbc:mysql://localhost:3306/grocery";
                String username = "root";
                String password = "sharana";
                
                PreparedStatement pre = null; 
                String query;
                Connection con = null;
                
           public payment(){
               try{
               con = DriverManager.getConnection(url, username, password);
               pre = con.prepareStatement("insert into payment(oid,eid,amount,time) values(?,?,?,?)");
               }catch(SQLException e){
                   e.printStackTrace();
               }
           }
           
           public int setPayment(String oid,String eid,String amount,Timestamp time){
           
               int result = 0;
               try{
               pre.setString(1, oid);
               pre.setString(2, eid);
               pre.setString(3, amount);
               pre.setTimestamp(4, time);
               
               result = pre.executeUpdate();
               }catch(SQLException e){
                   e.printStackTrace();
               }
               return result;
           }
        }
  
  %>
    
  
   <% 
      
        int result = 0;
        
       String oid = new String();
       String did = new String();
       String amount = new String();
        
        Date d1 = new Date();
        Timestamp time =  new Timestamp(d1.getTime()); 
       
            did = session.getAttribute("user_name").toString();
        
                if(request.getParameter("submit") != null){
                   if(request.getParameter("oid") != null){  
             oid = request.getParameter("oid");
                   }
                    
                     if(request.getParameter("amount") != null){
            amount =request.getParameter("amount"); 
                }
                }
      payment p = new payment();
      result = p.setPayment(oid, did, amount, time);
     
       
  %>
  
     <form name="payment" action="payment.jsp" method="POST" >
            <table>
                <tr>
                    <td>Order ID: </td>
                    <td><input type="text" name="oid" placeholder="001" /></td>
                </tr>
               
                <tr>
                    <td>Received Amount: </td>
                    <td><input type="text" name="amount" placeholder="Rs.1000" /></td>
                </tr>
                <tr>
                    <td><input type="submit" name="submit"  /></td>
                </tr>
            </table>
        </form>
     
  
    <% } else {
                response.sendRedirect("login.jsp?id=Your session may be expired. You have to login first");
            }
        %>
    </body>
    </html>    