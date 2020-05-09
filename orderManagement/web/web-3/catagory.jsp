<%@page import="java.sql.*;"%>
<%Class.forName("com.mysql.jdbc.Driver");%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
     
    <body>  <style>
        
   .mycart{
            width: 150px;
            height: 125px;
            margin: 80px auto;
            background: #FFFFFF;      
            border-radius: 6px;
 
            display:inline-table;
            

        }
        #cat{
             border:1px solid #333;
             background-color:#FFFFFF;
             border-radius:5px;
             padding: 20px;
            
        }
        .btn-btn-success{
            background-color:#E1E8EE;
            text-decoration-color: black;
            padding: 3px;
        }
        #text{
            width:70px;
            height:20px;
        }
        a{
            text-decoration: none;
            padding:3px;
            
            
        }
    </style>  
   


<%!
    public class category{
    
            String url="jdbc:mysql://localhost:3306/grocery";
            String username="root";
            String password = "sharana";
            
            Connection conn = null;
            PreparedStatement pre = null;
            ResultSet result = null;  
            String query;
                    
    
            public category(){
            try{
                conn = DriverManager.getConnection(url,username,password);
                query = "select image,pid,name,sellPrice,weight from product where ptype=?";
                  pre =conn.prepareStatement(query);
            }catch(SQLException e){
                e.printStackTrace();
            }
                        
            }
            
           public ResultSet getCategory(String type){
            try{
                pre.setString(1,type);
                result = pre.executeQuery();
            } catch (Exception e){
                e.printStackTrace();
            }
            
            return result;
        }
           
    }   
    
            %>
          
            
            <%
                String type = new String();
             
                     type = request.getParameter("catagory_type");
                 
                
                category c1 = new category();
                ResultSet cart = c1.getCategory(type);
%>
  
  <table border = " 1" bgcolor="biege" >   
       
     <% while(cart.next())  { %>
 
     <div class="mycart">
         <form name="item" action="cart.jsp" method="POST">
          <div id="cat">
             <img src =" <%= cart.getBlob("image") %>" class="image-responsive" />
             <h4 class="text-info"><%= cart.getString("name") %></h4>
             <h4 class="text-price"><%= cart.getDouble("sellPrice") %></h4>
             <h4 class="text-weight"><%= cart.getDouble("weight") %></h4>
             <a href="produc.jsp">view </a>
             <input type="text" value="quantity" name="quantity" id="text" /> 
             <input type="hidden" value="<%= cart.getString("pid") %>" name="hidden_id" />
             <input type="hidden" value="<%= cart.getString("name") %>" name="hidden_name" />
             <input type="hidden" value="<%= cart.getDouble("sellPrice") %>" name="hidden_price" />
             <input type="submit" name="add_to_cart" style="margin-top:5px;" class="btn-btn-success" value="Add to cart" />
     </div>
         </form>
     </div>
        <% } %>
  
       
</table> 
    </body>
</html>