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
        
          <% if(session.getAttribute("user_name")!=null){ %> 
        
  <%! 
        public class retailOrder{
        
                String url ="jdbc:mysql://localhost:3306/grocery";
                String username = "root";
                String password = "sharana";
                
                PreparedStatement prep = null;
                PreparedStatement pr = null;
                PreparedStatement p = null;
                
                String query4;
                String query1;
                String query2;
                String query3;
                
                Connection con = null;
                
            public retailOrder(){
                try{
                con = DriverManager.getConnection(url, username, password);
                query4 = "insert into order_retail(item,quantity,price,total,date,pid,cid) values(?,?,?,?,?,?,?)";
                query1 = "update product set  quantity=quantity - ?   where pid=?";
                query2 = "update product set sellQuantity=sellQuantity + ? where pid=?";
               
               
                prep = con.prepareStatement(query4);
                 pr = con.prepareStatement(query1);
                p = con.prepareStatement(query2);
                 
        }catch(SQLException e){
                e.printStackTrace();
        }
            }
            
            public int setDetails(String item,String quan,String price,String total,Timestamp date,String pid,String cid){
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
             
        
         
        retailOrder o1 = new retailOrder();
        result = o1.setDetails(item, quan, price, total, time,id,cid);
        result1  = o1.enterDetails(quan,id);
        result2 = o1.updateDetails(quan,id); 
     
       
  %>
  
 <% }
        else
        {
            response.sendRedirect("login.jsp?id= You have to login first to continue");
        }
      %>
        
   
  
        
        
    </body>
</html>