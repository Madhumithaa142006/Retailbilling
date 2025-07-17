<%@ page import="java.sql.*" %>
<%@ page session="true" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%
String action = request.getParameter("action");
String pid = request.getParameter("pid");
String pname = request.getParameter("pname");
String price = request.getParameter("price");

Class.forName("com.mysql.cj.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/billing","root","root");

String user = "Guest";  // Default username for all

if("add".equals(action)){
    // Check if product already in cart
    PreparedStatement check=con.prepareStatement("SELECT * FROM cart WHERE username=? AND product_id=?");
    check.setString(1,user);
    check.setInt(2,Integer.parseInt(pid));
    ResultSet rs=check.executeQuery();

    if(rs.next()){
        int oldQty = rs.getInt("quantity");
        PreparedStatement update=con.prepareStatement("UPDATE cart SET quantity=? WHERE id=?");
        update.setInt(1, oldQty+1);
        update.setInt(2, rs.getInt("id"));
        update.executeUpdate();
    }else{
        PreparedStatement ps=con.prepareStatement("INSERT INTO cart(username,product_id,product_name,price,quantity) VALUES (?,?,?,?,1)");
        ps.setString(1,user);
        ps.setInt(2,Integer.parseInt(pid));
        ps.setString(3,pname);
        ps.setDouble(4,Double.parseDouble(price));
        ps.executeUpdate();
    }
}
%>

<html>
<head>
<title>Your Cart</title>
<style>
body { background: #7b2cbf; color: white; font-family: Arial; }
table { background: #fff; color: #000; margin: auto; padding: 20px; border-radius: 10px; }
th, td { padding: 8px 12px; }
button { background: red; color: white; border: none; padding: 5px 10px; cursor: pointer; }
</style>
</head>
<body>

<h2 style="text-align:center;">Your Cart</h2>

<%
if(request.getParameter("delete_id")!=null){
    PreparedStatement del=con.prepareStatement("DELETE FROM cart WHERE id=?");
    del.setInt(1,Integer.parseInt(request.getParameter("delete_id")));
    del.executeUpdate();
}
%>

<table border="1">
<tr><th>Product</th><th>Price</th><th>Qty</th><th>Action</th></tr>

<%
PreparedStatement ps=con.prepareStatement("SELECT * FROM cart WHERE username=?");
ps.setString(1,user);
ResultSet rs=ps.executeQuery();

boolean hasItems=false;
while(rs.next()){
hasItems=true;
%>
<tr>
<td><%=rs.getString("product_name")%></td>
<td>₹<%=rs.getDouble("price")%></td>
<td><%=rs.getInt("quantity")%></td>
<td>
    <form method="post">
        <input type="hidden" name="delete_id" value="<%=rs.getInt("id")%>">
        <button type="submit">Delete</button>
    </form>
</td>
</tr>
<%
}
if(!hasItems){
%>
<tr><td colspan="4" style="text-align:center;">Your cart is empty.</td></tr>
<%
}
con.close();
%>
</table>

<center><a href="product-details.jsp" style="color:white;">Continue Shopping</a></center>

</body>
</html>
