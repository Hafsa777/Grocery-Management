<%@ page import="java.sql.*" %> 
<%@ page import="java.io.*" %> 
<%@ page import="java.util.*" %> 
<!DOCTYPE html>
<html>
   <head>
       
        <link rel="stylesheet" media="screen,projection" type="text/css" href="cart.css" />
        <link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
	<link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
	<link href="css/font-awesome.css" rel="stylesheet">
	<!--pop-up-box-->
	<link href="css/popuo-box.css" rel="stylesheet" type="text/css" media="all" />
	<!--//pop-up-box-->
	<!-- price range -->
	
	<!-- fonts -->
	<link href="//fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i,800" rel="stylesheet">
          
<script type="text/javascript">
function remove() {
     confirm("Are you sure you want to delete the item!");
  
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

<style>
     #text{
            width:40px;
            height:20px;
        }
   #del{
    float :right;
    margin:20px;
    border:20px;
}
#delete{
    margin: 20px;
    border:20px;
    float:right;
    
} 
        
</style>
</head>



<body class="order">


    
    
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
                                                               
                           
                               quan =Integer.parseInt(request.getParameter("quan"));
                               sub = Double.parseDouble(request.getParameter("price"));
                               
                                calc ca = new calc();
                                
                          ca.total(quan,sub);
                          ca.subTotal(ca.total(quan, sub));
 
                          
                        if(quan >= 10){
                        
                            response.sendRedirect("bulk.jsp");
                        
                        }
                        
                        %>
                        
                     
            
	<div id="container">
	 <form method="post" action="cart1.jsp">
		<div class="table-responsive">
                    
                    <table id="cart" class="timetable_sub">
		     <caption>
                         <img src="../cart image.jpg" width="70" height="50"/>

                         My cart
                    </caption>
                       <div id="delete">
                           <a href="index.jsp"><img src="../delete.png" width="20" height="20"/>
                           </a></div>
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
                     
                                        <c:forEach >
                         
                         <tr id="header1">
                             <td><%=request.getParameter("pid") %></td>
                             <td><%=request.getParameter("item") %></td>
                             <td><input type="text" name="quant" value="<%=request.getParameter("quan")%>" id="text">
                             
                                 <input type="submit" value="+" name="submit"/></td>
                             <td><%=request.getParameter("price") %></td>
                            
                             <td class="price"> <%= ca.total(quan,sub ) %></td>    
                               <input type="hidden"  name="price" value="<%=request.getParameter("price") %>" />
                             
                     </tr>             
                    </c:forEach >
			<tr id="subtotal">
                            <td colspan="5">Subtotal: <span id="sum"><%= ca.subTotal(ca.total(quan, sub))%></span></td>
                        </tr> 
                              <input type="hidden"  name="qu" value="<%=request.getParameter("quant") %>" />           
                        
                    </tbody>
                   </table>

              </form>
                        <form method="post" action="checkout.jsp">
                  
                        <input type="hidden"   name="pid" value ="<%=request.getParameter("pid")%>" >
                         <input type="hidden"  name="quantity" value="<%=request.getParameter("quan")%>" />
                         <input type="hidden"  name="price" value="<%=request.getParameter("price") %>" />
                         <input type="hidden"  name="item"  value="<%=request.getParameter("item") %>"/> 
                         <input type="hidden"  name="total" value="<%=ca.total(quan,sub) %>" />
                         <input type="hidden"  name="subTotal"  value="<%= ca.subTotal(ca.total(quan, sub))%>"/> 
                        <div id="process_cart">
                            <input type="submit" name="checkout" value="Checkout" class="checkout" /> 
			</div>
			<div id="continue_shopping">
                            <a id="shop" href="index.jsp">&lt;&lt;&lt; Continue to shopping</a>
			</div>
                                                                 
                    </form>
            </div>
	</div>
                        
    

</body>
</html>
 