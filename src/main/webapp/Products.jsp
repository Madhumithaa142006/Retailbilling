<%@ page import="java.sql.*" %>
<%@ page session="true" %>

<%
String action = request.getParameter("action");

if("buy".equals(action)){
    String pid = request.getParameter("pid");
    String pname = request.getParameter("pname");
    String price = request.getParameter("price");
%>

<html>
<head>
    <title>Buy Product</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body style="background: linear-gradient(135deg, #7b2cbf, #9d4edd); color:white;">

<div class="container mt-5">
    <h2>Purchase: <%=pname%></h2>
    
    <form action="Products.jsp" method="post">
        <input type="hidden" name="action" value="confirm">
        <input type="hidden" name="pid" value="<%=pid%>">
        <input type="hidden" name="pname" value="<%=pname%>">
        <input type="hidden" name="price" value="<%=price%>">
        
        <div class="mb-3">
            <label>Customer Name:</label>
            <input type="text" name="customer_name" class="form-control" required>
        </div>
        <div class="mb-3">
            <label>Quantity:</label>
            <input type="number" name="quantity" class="form-control" min="1" required>
        </div>
        
        <button type="submit" class="btn btn-success">Confirm Purchase</button>
    </form>
</div>

</body>
</html>

<%
} else if("confirm".equals(action)){
    String pid = request.getParameter("pid");
    String pname = request.getParameter("pname");
    double price = Double.parseDouble(request.getParameter("price"));
    String customer = request.getParameter("customer_name");
    int qty = Integer.parseInt(request.getParameter("quantity"));

    // Insert into Products table (update stock or log the purchase)
    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/billing","root","root");

    // Check if product exists
    PreparedStatement check=con.prepareStatement("SELECT * FROM Products WHERE pid=?");
    check.setInt(1,Integer.parseInt(pid));
    ResultSet rs=check.executeQuery();

    if(rs.next()){
        // Update quantity in Products table
        int oldQty = rs.getInt("quantity");
        PreparedStatement update=con.prepareStatement("UPDATE Products SET quantity=? WHERE pid=?");
        update.setInt(1, oldQty - qty);
        update.setInt(2, Integer.parseInt(pid));
        update.executeUpdate();
    } else {
        // If not present, insert as new product
        PreparedStatement insert=con.prepareStatement("INSERT INTO Products(productname, quantity, price, supplier) VALUES (?,?,?,?)");
        insert.setString(1, pname);
        insert.setInt(2, qty);
        insert.setDouble(3, price);
        insert.setString(4, "Default Supplier");
        insert.executeUpdate();
    }

    // Prepare data to send to billing.jsp
    session.setAttribute("customer", customer);
    session.setAttribute("pid", pid);
    session.setAttribute("pname", pname);
    session.setAttribute("price", price);
    session.setAttribute("quantity", qty);

    con.close();
    response.sendRedirect("billing.jsp");
} else {
    response.sendRedirect("product-details.jsp");
}
%>


