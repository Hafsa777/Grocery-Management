<%@page import="java.sql.*;"%>
<%Class.forName("com.mysql.jdbc.Driver");%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        
    <script type="text/javascript">
        function deliver(){
            var r = alert(" You confirmed the Order");
	if (r == true)
		window.location.href='invoice.jsp';
        }
       function validate(){
                
           
       }
    </script>
    <style>
        #t1{
            border-collapse: collapse;
            width: 65%;
        }
        #check1{
            top-padding:10px;
            top-margin:5px;
        }
        #check2{
            float:left;
            margin-left: 30px;
            padding-left:10px;
            padding-top:10px;
            margin-top:20px;
        }
        #check{
            float:right;
            width:400px;
           padding-right: 10px;
           margin-right:100px;
           margin-top:40px;
           
        }
      
        #f1{
             width:300px;
             height:200px;
             padding-right:30px;
             margin-right: 40px;
        }

        #submit{
            padding:10px;
            text-decoration-color:black;
        }
            
    </style>
     </head>
    <body>
        <div id="wrap">
        <div id="check1" >
        <table border="0" width="400px" cellspacing="3" cellpadding="4">
            
            <tbody>
                <tr>
                    <td> <%=request.getParameter("item")%></td>
                    <td> <%=request.getParameter("quantity") %></td>
                    <td> <%=request.getParameter("total")%></td>
                </tr>
            <br><br><br>
            </tbody>
        </table>
        </div>
                <div id="check2">
                <table border="1 px solid" width="500px" cellspacing="3" cellpadding="4">
                    <thead>
                    <caption>Payment Summary</caption>
                    </thead>
                    <tbody>
                <tr>
                    <td>Final payment</td>
                    <td><%=request.getParameter("subTotal") %></td>
                </tr>
                  <tr>
                    <td>Shipping</td>
                    <td>Rs.200</td>
                </tr>
                  <tr>
                    <td>Tax</td>
                    <td>Rs.100</td>
                </tr>
                 
            </tbody>
        </table>
                </div>
                <div id="check">
                   
                    <form name="confirmation" action="newjsp2.jsp" method="POST" id="f1">
                        <table  width="500px" cellspacing="3" cellpadding="4">
                            <caption>Confirm the Deliver Details</caption>
                            <tbody>
                                <tr>
                                    <td>Shipping Address</td>
                                    <td><input type="text" name="address" value="" /></td>
                                </tr>
                                <tr>
                                    <td>Email </td>
                                    <td><input type="text" name="mail" value="" /></td>
                                </tr>
                                <tr>
                                    <td>Phone Number</td>
                                    <td><input type="text" name="no" value="" /></td>
                                </tr>
                            </tbody>
                        </table>
                      
                         <input type="hidden" value ="<%=request.getParameter("item")%>" name="item">
                        <input type="hidden" value ="<%=request.getParameter("quantity")%>" name="quan">
                        <input type="hidden" value ="<%=request.getParameter("price")%>" name="price">
                        <input type="hidden" value ="<%=request.getParameter("total")%>" name="total">
                        <input type="hidden" value ="<%=request.getParameter("pid")%>" name="pid">
                       <div id="submit">
                        <input type="submit" value="Deliver" onclick="deliver()" />
                       </div>
                      

                        
                        
                    </form>
                </div>
        </div>
                
    </body>
</html>