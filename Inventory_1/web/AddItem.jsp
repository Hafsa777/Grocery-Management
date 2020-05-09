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
    <body><div class="well">  <ul>
                
        </div>
           
            
        <%!
              public class Add{
                    
                        
                        String URL = "jdbc:mysql://localhost:3306/grocery";
                        String USERNAME = "root";
                        String PASSWORD = "sharana";
                
                        Connection conn = null;

                        PreparedStatement pre = null;
                        
                        ResultSet result = null;  
                         
                        String query;
                       

                 public Add(){
                    try{
                        conn = DriverManager.getConnection(URL,USERNAME,PASSWORD);
                        query = "insert into grocery.product(pid,name,ptype,description,sellPrice,buyPrice,quantity,weight) values(?,?,?,?,?,?,?,?)";
                       
                        pre = conn.prepareStatement(query);
                       
                     }catch(SQLException e){

                        e.printStackTrace();
                }
                }

                public int setNames(String code, String name,String ptype,String description,String sellPrice,String buyPrice,String quantity,String weight){

                    int result = 0;

                try{
                        pre.setString(1, code);
                        pre.setString(2, name);
                        pre.setString(3, ptype);
                        pre.setString(4,description);
                        pre.setString(5,sellPrice);
                        pre.setString(6,buyPrice);
                        pre.setString(7, quantity);
                        pre.setString(8,weight);
                       
                       
                        
                        result = pre.executeUpdate();                       

                  }catch(SQLException e){

                    e.printStackTrace();
                    
                }
                    return result;
            }
    }
      %>
      
      
      <%
          int result=0;
          
          //String code=new String();
          //String name=new String();
          //String ptype=new String();
          //String description=new String();
          //String sellPrice=new String();
          //String buyPrice=new String();
          //String quantity=new String();
          //String weight=new String();
          
          //if (request.getParameter("code")!=null){
           String   code=request.getParameter("ItemCode");
          
          //if (request.getParameter("name")!=null){
            String  name=request.getParameter("ProductName");
          
          //if (request.getParameter("ptype")!=null){
              String ptype=request.getParameter("catagory");
          
          //if (request.getParameter("description")!=null){
              String description=request.getParameter("description");
          
          //if (request.getParameter("sellPrice")!=null){
              String sellPrice=request.getParameter("sellPrice");
          
          //if (request.getParameter("buyPrice")!=null){
              String buyPrice=request.getParameter("buyingPrice");
          
          //if (request.getParameter("quantity")!=null){
              String quantity=request.getParameter("quantity");
          
          //if (request.getParameter("weight")!=null){
              String weight=request.getParameter("weight");
          
                  
          

          Add add=new Add();
          result=add.setNames(code,name,ptype,description,sellPrice,buyPrice,quantity,weight);

         %>
         
          <div class="well1">
              
              <div class="welll">
                  Search<input type="text" name="search" value="Product Name" size="130" />
                <input type="text" name="search" value="code" size="50" />
                <input type="submit" value="Search" name="Search" />
            </div>
              
              
              <div class="container">
                  <form name="AddItemForm" action="AddNew.jsp" method="POST">
            <table border="0">
                
                <tbody>
                    <tr>
                        <td>Item Code</td>
                        <td><input type="text" name="ItemCode" value="" size="50" /></td>
                    </tr>
                    <tr>
                        <td>Product Name</td>
                        <td><input type="text" name="ProductName" value="" size="50" /></td>
                    </tr>
                    <tr>
                        <td>category</td>
                        <td><input type="text" name="catagory" value="" size="50" /></td>
                    </tr>
                    <tr>
                        <td>Description</td>
                        <td><input type="text" name="description" value="" size="50" /></td>
                    </tr>
                    <tr>
                        <td>Selling Price</td>
                        <td><input type="text" name="sellPrice" value="" size="50" /></td>
                    </tr>
                    <tr>
                        <td>Buying Price</td>
                        <td><input type="text" name="buyingPrice" value="" size="50" /></td>
                    </tr>
                    <tr>
                        <td>quantity</td>
                        <td><input type="text" name="quantity" value="" size="50" /></td>
                    </tr>
                     <tr>
                        <td>Weight</td>
                        <td><input type="text" name="weight" value="" size="50" /></td>
                    </tr>
                    <tr>
                        <td><input type="submit" value="Add" name="Add" /></td>
                    </tr>
                </tbody>
            </table>

        </form>

              </div>
              <div class="naviside">
                  <nav>
                      <ul>
                          <li><a href="Add.jsp">Add New Item</a></li>
                          <li><a href="delete_product.jsp">Delete Product</a></li>
                          <li><a href="restock.jsp">Restock</a></li>
                          <li><a href="report.jsp">Report</a></li>
                    
                    
                     
                      </ul>
                  </nav>
              </div>
              
       
          </div>              
    </body>
</html>
