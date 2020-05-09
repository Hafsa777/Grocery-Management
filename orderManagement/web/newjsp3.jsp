<%@page import="java.util.Collection"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" media="screen,projection" type="text/css" href="cart.css" />
        <title>JSP Page</title>
        
        
<script type="text/javascript">
function remove() {
	var r = confirm("Are you sure you want to delete the item!");
	if (r == true)
            
        
		//window.location.href='cancel.jsp'; 
	//<a href="cancel.jsp"><span>Checkout</span></a> <!-- Checkout cart -->
}
function checkoutCart() {
	window.location.href="update.jsp";
}
function increase_by_one() {
   
       		window.location.href='cart?action=cancel.jsp'; 
}
function decrease_by_one() {
   
       		window.location.href='cart?action=cancel'; 
}
</script>
</head>



<body class="order">

    <%
        if(request.getParameter("add_to_cart") != null) {
            
          
    
            if(session.getAttribute("shopping_cart")!= null){
            
               //String[] arr = {session.getAttribute("shopping_cart").toString(),request.getParameter("hidden_id")};            
               
               if(request.getParameter("hidden_id") != null){
                
                String name = request.getParameter("hidden_name");
                String id = request.getParameter("hidden_id");
                String price = request.getParameter("hidden_price");
                String quantity = request.getParameter("quantity");
                
                String[] ch  = {name,id,price,quantity};
            
               session.setAttribute("shopping_cart",ch);
                   
                   
             
               }
               else {%>
               
                   <script type="text/javascript">
                           
                           alert("Item Added!!!");
                           windows.location.href("ASDERGG.jsp");
                   </script>
               <% 
               }
            }else{
            
                String name = request.getParameter("hidden_name");
                String id = request.getParameter("hidden_id");
                String price = request.getParameter("hidden_price");
                String quantity = request.getParameter("quantity");
                
               String[] ch  = {name,id,price,quantity};
            
               session.setAttribute("shopping_cart",ch);
            }
   
            
    %>
    
     <%!
                public class calc{
                         double total=0;
                            double sub=0;
                            
                            public double total(int quant, double price){
                                return total= quant*price;
                            }
                            
                            public double subTotal(double tot){
                               return   sub+tot;

                            }
                }
                %>
                
              
                        
                        
                        <% 
                                 double sub=0;
                                 int quan = 0;
        
                        
                               if(request.getParameter("add_to_cart")!= null){
                        
                                   sub = Double.parseDouble(request.getParameter("hidden_price"));
                                   quan =Integer.parseInt(request.getParameter("quantity"));
                               }
                                calc ca = new calc();
                            
                          ca.total(quan,sub);
                          ca.subTotal(ca.total(quan, sub));
  
                          
                        if(quan>=25){
                        
                            response.sendRedirect("orderBulk.jsp");
                        
                        }
                        
                        %>
                        
    <div id="wrap">            
	<div id="container">
	 <form method="post" action="checkout.jsp">
		<table id="cart">
		     <caption>
                       <img src="cart image.jpg" alt="Icon cart" height="50px" width="70px" />
                       My Cart
                    </caption>
                       <div id="delete">
                         <a href="mycart.jsp"> <img id="del" src="delete.png" height="20px" width="20px" float="right" /></a></div>
                   <thead>
		   <tr id="header">
						
                        <th>Code</th>
			<th>Item</th>
			<th>Quantity</th>
                        <th>price</th>
                        <th>Total</th>
                   </tr>
		  </thead>    
                  <tbody>
                      <%  if(session.getAttribute("shopping_cart") != null){ %>
                  <c:forEach session.getAttribute("shopping_cart")>
                         <tr id="header1">
                             <td><%= request.getParameter("hidden_id") %></td>
                             <td><%=request.getParameter("hidden_name") %></td>
                             <td><%=request.getParameter("quantity") %></td>
                             <td><%=request.getParameter("hidden_price") %></td>
                             <td class="price"> <%= ca.total(quan,sub ) %></td>    
                             <td><input type="button" id="add" name="add_btn" value="+" onclick="increase_by_one()"/>
                                 <input type="button" id="sub" name="subs_btn" value="-" onclick="decrease_by_one(<%=request.getParameter("quantity")%>)"/> </td>
                                <td><input type="reset" value="Remove" onclick="remove()"  name="remove"/></td>
                            </tr>
                            <% } %>                     
                    </c:forEach >
			<tr id="subtotal">
                            <td colspan="5">Subtotal: <span id="sum"><%= ca.subTotal(ca.total(quan, sub))%></span></td>
                        </tr> 
                                        
                    </tbody>
                   </table>
                        <input type="hidden"   name="pid" value ="<%=request.getParameter("hidden_id")%>" >
                         <input type="hidden"  name="quantity" value="<%=request.getParameter("quantity") %>" />
                         <input type="hidden"  name="price" value="<%=request.getParameter("hidden_price") %>" />
                         <input type="hidden"  name="item"  value="<%=request.getParameter("hidden_name") %>"/> 
                         <input type="hidden"  name="total" value="<%=ca.total(quan,sub) %>" />
                         <input type="hidden"  name="subTotal"  value="<%= ca.subTotal(ca.total(quan, sub))%>"/> 
                        <div id="process_cart">
                            <input type="submit" name="checkout" value="Checkout" class="checkout" /> 
			</div>
				
			<div id="continue_shopping">
                            <a id="shop" href="product_cover.jsp">&lt;&lt;&lt; Continue to shopping</a>
			</div>
                                                                 
         </form>
            </div>
	</div>
                        
                         <%} else {
                                out.println("Cart iis Empty!!!");
}                   %>
                        
</body>
</html>
 