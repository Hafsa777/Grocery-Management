<%@page import="java.sql.*;"%>
<%Class.forName("com.mysql.jdbc.Driver");%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html> 
  <head>
      
    <style>
        
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
             background-color:beige;
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
  </head>
  
   
    
    <body>
    <%!
    public class myCart{
    
            String url="jdbc:mysql://localhost:3306/grocery";
            String username="root";
            String password = "sharana";
            
            Connection conn = null;
            PreparedStatement pre = null;
            ResultSet result = null;  
            String query;
                    
    
            public myCart(){
            try{
                conn = DriverManager.getConnection(url,username,password);
                query = "select image,pid,name,sellPrice,weight from product ";
                  pre =conn.prepareStatement(query);
            }catch(SQLException e){
                e.printStackTrace();
            }
                        
            }
            
           public ResultSet getCart(){
            try{
                result = pre.executeQuery();
            } catch (Exception e){
                e.printStackTrace();
            }
            
            return result;
        }
           
    }   
    
            %>
          
            
            <%
   
    
    myCart c1 = new myCart();
    ResultSet cart = c1.getCart();
%>
   



     <table border = " 1" bgcolor="biege" >
 
      
         
     <% while(cart.next())  { %>
     <div class="mycart">
         <form name="item" action="cart.jsp?action=add&id=<%= cart.getString("pid") %>" method="POST">
          <div id="cat">
             <img src =" <%= cart.getBlob("image") %>" class="image-responsive" />
             <h4 class="text-info"><%= cart.getString("name") %></h4>
             <h4 class="text-price"><%= cart.getDouble("sellPrice") %></h4>
             <h4 class="text-weight"><%= cart.getDouble("weight") %></h4> 
             <a href="produc.jsp">view </a>
              <input type="hidden" value="1" name="quantity" />
             <input type="hidden" value="<%= cart.getString("pid") %>" name="hidden_id" />
             <input type="hidden" value="<%= cart.getString("name") %>" name="hidden_name" />
             <input type="hidden" value="<%= cart.getDouble("sellPrice") %>" name="hidden_price" />
             <input type="submit" name="add_to_cart" style="margin-top:5px;" class="btn-btn-success" value="Add to cart" />
    
      </div>
         </form>
             
             <%
                    String name = "001";
                    request.setAttribute("id",name);
             %>
     </div>
        <% } %>
  
       
</table> 

    </body>    
</html>

