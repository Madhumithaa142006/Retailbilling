<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Product Details</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;600&display=swap" rel="stylesheet">
    <style>
        body {
            background: linear-gradient(135deg, #7b2cbf, #9d4edd);
            color: white;
            font-family: 'Poppins', sans-serif;
        }
        .card {
            background: #fff;
            color: #000;
            border-radius: 15px;
            transition: transform 0.3s ease;
            box-shadow: 0 4px 12px rgba(0,0,0,0.2);
        }
        .card:hover {
            transform: scale(1.05);
        }
        .product-img {
            height: 150px;
            object-fit: contain;
            padding: 15px;
        }
        .btn {
            margin: 5px 2px;
        }
        h2 {
            text-align: center;
            margin: 30px 0;
            font-weight: 600;
        }
    </style>
</head>
<body>

<div class="container mt-4">
    <h2>🛒 Product Details - Shopping Zone</h2>
    <div class="row">

<%
String[] products = {
    "Headphone", "Smartphone", "Laptop", "Tablet", "Smartwatch", "Bluetooth Speaker",
    "Camera", "Printer", "Monitor", "Keyboard", "Mouse", "Router",
    "Power Bank", "USB Cable", "Memory Card", "Hard Disk", "TV", "Air Conditioner",
    "Refrigerator", "Washing Machine", "Microwave", "Oven", "Water Purifier", "Fan",
    "Iron Box", "Mixer Grinder", "Toaster", "Coffee Maker", "Hair Dryer", "Shaver"
};

double[] prices = {
    1500, 12000, 45000, 18000, 7000, 2500,
    15000, 8000, 10000, 1200, 800, 3000,
    1500, 200, 500, 3500, 30000, 25000,
    20000, 15000, 8000, 6000, 9000, 1200,
    1000, 4000, 1500, 3000, 1000, 1200
};

String[] images = {
    "headphone.png", "smartphone.png", "laptop.png", "tablet.png", "smartwatch.png", "bluetoothspeaker.png",
    "camera.png", "printer.png", "monitor.png", "keyboard.png", "mouse.png", "router.png",
    "powerbank.png", "usbcable.png", "memorycard.png", "harddisk.png", "tv.png", "airconditioner.png",
    "refrigerator.png", "washingmachine.png", "microwave.png", "oven.png", "waterpurifier.png", "fan.png",
    "ironbox.png", "mixergrinder.png", "toaster.png", "coffeemaker.png", "hairdryer.png", "shaver.png"
};

for(int i=0; i<30; i++){
%>

<div class="col-md-4 mb-4">
    <div class="card">
        <img src="images/<%=images[i]%>" class="card-img-top product-img" alt="<%=products[i]%>">
        <div class="card-body text-center">
            <h5 class="card-title"><%=products[i]%></h5>
            <p>Price: ₹<%=prices[i]%></p>
            <form action="Products.jsp" method="post" style="display:inline;">
                <input type="hidden" name="pid" value="<%=i+1%>">
                <input type="hidden" name="pname" value="<%=products[i]%>">
                <input type="hidden" name="price" value="<%=prices[i]%>">
                <button type="submit" name="action" value="buy" class="btn btn-primary btn-sm">Buy</button>
            </form>
            <form action="cart.jsp" method="post" style="display:inline;">
                <input type="hidden" name="pid" value="<%=i+1%>">
                <input type="hidden" name="pname" value="<%=products[i]%>">
                <input type="hidden" name="price" value="<%=prices[i]%>">
                <button type="submit" name="action" value="add" class="btn btn-success btn-sm">Add to Cart</button>
            </form>
        </div>
    </div>
</div>

<% } %>

    </div>
</div>

</body>
</html>


