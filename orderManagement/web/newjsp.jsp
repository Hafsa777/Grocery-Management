<%-- 
    Document   : newjsp
    Created on : Aug 31, 2018, 11:58:07 AM
    Author     : User
--%>
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
                query = "insert into payment(oid,eid,amount,time) values(?,?,?,?)";
               
               
                pre = con.prepareStatement(query);
                
                 
        }catch(SQLException e){
                e.printStackTrace();
        }
            }
            
            public int setDetails(String oid,String did,String amount,Timestamp date){
                int result = 0;
                try{
                
                     pre.setString(1, oid);
                     pre.setString(2, did);
                     pre.setString(3, amount);
                     pre.setTimestamp(4, date);
                     
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
       
                if(request.getParameter("submit") != null){
                   if(request.getParameter("oid") != null){  
             oid = request.getParameter("oid");
                   }
                    if(request.getParameter("did") != null){
             did = request.getParameter("did"); 
                    }
                     if(request.getParameter("amount") != null){
            amount =request.getParameter("amount"); 
                }
                }
        payment  p = new payment();
        result = p.setDetails(oid,did,amount,time);
       
     
       
  %>
    </body>
</html>
