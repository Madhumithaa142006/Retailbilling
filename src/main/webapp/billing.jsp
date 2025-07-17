<%@ page import="java.sql.*" %>
<%@ page session="true" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Billing | Purple Shop</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" />
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <style>
        body {
            background: linear-gradient(135deg, #7b2cbf, #9d4edd);
            color: white;
            font-family: 'Poppins', sans-serif;
        }
        .bill-box {
            background: #fff;
            color: #333;
            border-radius: 20px;
            padding: 30px;
            max-width: 500px;
            margin: 50px auto;
            box-shadow: 0 0 15px rgba(0,0,0,0.4);
        }
        h2 {
            text-align: center;
            color: #5a189a;
            margin-bottom: 20px;
        }
        .btn-print {
            margin-top: 20px;
            display: block;
            width: 100%;
        }
    </style>
</head>
<body>

<%
String customer = (String)session.getAttribute("customer");
String pid = (String)session.getAttribute("pid");
String pname = (String)session.getAttribute("pname");
Double priceObj = (Double)session.getAttribute("price");
Integer quantityObj = (Integer)session.getAttribute("quantity");

// Check if product is selected
if(customer == null || pid == null || pname == null || priceObj == null || quantityObj == null){
%>
<script>
    Swal.fire({
        icon: 'warning',
        title: 'No Product Selected',
        text: 'Please select a product before billing.',
        confirmButtonColor: '#7b2cbf'
    }).then(() => {
        window.location.href = 'product-details.jsp';
    });
</script>
<%
} else {
    double price = priceObj;
    int quantity = quantityObj;

    double subtotal = price * quantity;
    double tax = subtotal * 0.10; // 10% GST
    double total = subtotal + tax;

    // Insert into bills & bill_items
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/billing","root","root");

        // Insert into bills table
        PreparedStatement ps1 = con.prepareStatement("INSERT INTO bills(customer_name, total_amount) VALUES (?,?)", Statement.RETURN_GENERATED_KEYS);
        ps1.setString(1, customer);
        ps1.setDouble(2, total);
        ps1.executeUpdate();

        ResultSet keys = ps1.getGeneratedKeys();
        keys.next();
        int billId = keys.getInt(1);

        // Insert into bill_items table
        PreparedStatement ps2 = con.prepareStatement("INSERT INTO bill_items(bill_id, product_id, product_name, quantity, price) VALUES (?,?,?,?,?)");
        ps2.setInt(1, billId);
        ps2.setInt(2, Integer.parseInt(pid));
        ps2.setString(3, pname);
        ps2.setInt(4, quantity);
        ps2.setDouble(5, price);
        ps2.executeUpdate();

        con.close();
    } catch(Exception e){
        out.print("<script>Swal.fire('Error', 'Database error occurred!', 'error');</script>");
    }
%>

<div class="bill-box">
    <h2>🧾 Final Bill</h2>
    <p><b>Customer:</b> <%=customer%></p>
    <p><b>Product:</b> <%=pname%></p>
    <p><b>Quantity:</b> <%=quantity%></p>
    <p><b>Price per unit:</b> ₹<%=String.format("%.2f", price)%></p>
    <p><b>Subtotal:</b> ₹<%=String.format("%.2f", subtotal)%></p>
    <p><b>Tax (10% GST):</b> ₹<%=String.format("%.2f", tax)%></p>
    <h4><b>Total Amount:</b> ₹<%=String.format("%.2f", total)%></h4>

    <button class="btn btn-success btn-print" onclick="window.print()">🖨️ Print Bill</button>
    <a href="index.jsp" class="btn btn-outline-light btn-print">🏠 Back to Home</a>
</div>

<%
} // End of else block
%>

</body>
</html>


