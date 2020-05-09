<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %> 
<%@ page import="java.util.*" %> 
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" media="screen,projection" type="text/css" href="cart.css" />
        <title>JSP Page</title>
        
        
        
<script type="text/javascript">
function remove() {
	var r = confirm("Are you sure you want to delete the item!");
	if (r == true){}
		//window.location.href='cart?action=cancel'; 
	//<a href="shop?action=checkout"><span>Checkout</span></a> <!-- Checkout cart -->
}
function checkoutCart() {
	window.location.href="update.jsp";
}
function increase_by_one() {
   
       		window.location.href='cancel.jsp'; 
}
function decrease_by_one() {
   
       		window.location.href='cart?action=cancel.jsp'; 
}
</script>
</head>



<body class="order">    
    
     <%!
     
                public class calc{
                
                        double total=0;
                        double sub=0;
                         
                        public calc(){}
                       
                            public double total(int quant, double price,double dis){
                                return total= quant*(price - price*dis);
                            }
                            
                            public double subTotal(double tot){
                               return   sub+tot;

                            }
                }
                %>
                    
                        
                        <% 
                                 double sub=0;
                                 int quan = 0;
                                double dis =0;
                            
                                 
                               if(request.getParameter("add_to_cart")!= null){
                             sub = Double.parseDouble(request.getParameter("hidden_price"));
                             quan =Integer.parseInt(request.getParameter("quantity"));
                             //dis = Double.parseDouble(request.getParameter("hidden_discount"));
                               }
                               if(quan>12 || quan<=20){
                                   dis = 0.05; 
                               }
                               else if(quan>21 || quan<=40){
                                   dis = 0.15;
                        
                        }
                               else if(quan>41 && quan<=80){
                                   dis = 25.0;
                        
                        }
                               else if(quan>81 && quan<=150){
                                   dis = 50.0;
                        
                        }
                                calc ca = new calc();
                                
                          ca.total(quan,sub,dis);
                          ca.subTotal(ca.total(quan, sub,dis));
 
                         
                        
                        
                        %>
                        
    <div id="wrap">            
	<div id="container">
	 <form method="post" action="cart1.jsp">
		<table id="cart">
		     <caption>
                       <img src="cart image.jpg" alt="Icon cart" height="50px" width="70px" />
                       My Cart
                    </caption>
                       <div id="delete">
                         <a href="product_cover.jsp"> <img id="del" src="delete.png" height="20px" width="20px" float="right" /></a></div>
                   <thead>
		   <tr id="header">
						
                        <th>Code</th>
			<th>Item</th>
			<th>Quantity</th>
                        <th>price</th>
                        <th>Discount</th>
                        <th>Total</th>
                   </tr>
		  </thead>    
                  <tbody>
                     
                     <c:forEach >
                         
                         <tr id="header1">
                             <td><%=request.getParameter("hidden_id") %></td>
                             <td><%=request.getParameter("hidden_name") %></td>
                             <td><input type="text" name="quantity" value="1" id="text_box" name="quan">
                             
                                 <input type="submit" value="update" name="submit"/></td>
                             <td><%=request.getParameter("hidden_price") %></td>
                            
                             <td class="price"> <%= ca.total(quan,sub,dis ) %></td>    
                               <input type="hidden"  name="price" value="<%=request.getParameter("hidden_price") %>" />
                             
                            </tr>
                                               
                    </c:forEach >
			<tr id="subtotal">
                            <td colspan="5">Subtotal: <span id="sum"><%= ca.subTotal(ca.total(quan, sub, dis))%></span></td>
                        </tr> 
                                        
                       <input type="hidden"   name="pid" value ="<%=request.getParameter("hidden_id")%>" >
                         <input type="hidden"  name="quantity" value="<%=request.getParameter("quantity") %>" />
                         <input type="hidden"  name="price" value="<%=request.getParameter("hidden_price") %>" />
                         <input type="hidden"  name="item"  value="<%=request.getParameter("hidden_name") %>"/> 
                        <input type="hidden"  name="quan" value="<%=request.getParameter("quantity") %>" />
                    </tbody>
                   </table>
                        
                        
         </form>
                        <form method="post" action="checkout.jsp">
                            
                        <input type="hidden"   name="pid" value ="<%=request.getParameter("hidden_id")%>" >
                         <input type="hidden"  name="quantity" value="<%=request.getParameter("quantity") %>" />
                         <input type="hidden"  name="price" value="<%=request.getParameter("hidden_price") %>" />
                         <input type="hidden"  name="item"  value="<%=request.getParameter("hidden_name") %>"/> 
                        <input type="hidden"  name="quan" value="<%=request.getParameter("quantity") %>" />
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

</body>
</html>
 