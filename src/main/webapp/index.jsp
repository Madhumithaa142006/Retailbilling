<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="true" %>

<%
    String username = (String) session.getAttribute("username");
    if(username == null){
        response.sendRedirect("login.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <title>Shopping Zone | Home</title>
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" />
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" rel="stylesheet" />
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

    <style>
    body {
      background: linear-gradient(135deg, #7b2cbf, #9d4edd);
      font-family: 'Segoe UI', sans-serif;
      color: #fff;
      padding-bottom: 80px;
    }
    .navbar { background-color: #5a189a; }
    .navbar-brand, .nav-link, .navbar-text { color: #fff !important; }
    .nav-link:hover { color: #ffd6ff !important; }
    .hero { padding: 80px 20px; text-align: center; }
    .hero h1 { font-size: 3.2rem; font-weight: bold; }
    .hero p { font-size: 1.25rem; color: #e0c9ff; margin-top: 10px; }
    .footer { background-color: #5a189a; text-align: center; padding: 15px; position: fixed; width: 100%; bottom: 0; color: #ddd; }
    .card { border-radius: 20px; transition: transform 0.3s ease; }
    .card:hover { transform: scale(1.05); }
    .card-body { background-color: #f7f0ff; color: #333; border-radius: 0 0 20px 20px; }
    .card-body img { max-height: 120px; }
    </style>
</head>
<body>

<nav class="navbar navbar-expand-lg">
  <div class="container-fluid">
    <a class="navbar-brand fw-bold" href="#">🛍️ RETAIL SHOP</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navLinks">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navLinks">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item"><a class="nav-link" href="product-details.jsp">Product Details</a></li>
        <li class="nav-item"><a class="nav-link" href="cart.jsp">Cart</a></li>
        <li class="nav-item"><a class="nav-link" href="billing.jsp">Billing</a></li>
        <li class="nav-item"><a class="nav-link" href="profile.jsp">Profile</a></li>
        <li class="nav-item"><a class="nav-link" href="logout.jsp">Logout</a></li>
      </ul>
      <span class="navbar-text">Welcome, <%= username %>!</span>
    </div>
  </div>
</nav>

<div class="hero">
  <h1>🛒 Welcome to Shopping Zone!</h1>
  <p>Your one-stop destination for smart billing and smooth shopping 🧾✨</p>
</div>

<div class="container mt-4 mb-5">
  <div class="row g-4 text-center">
    <div class="col-md-4">
      <div class="card shadow">
        <div class="card-body">
          <img src="https://cdn-icons-png.flaticon.com/512/1302/1302451.png" alt="Product Details" class="img-fluid rounded mb-3" />
          <h5 class="card-title">📋 Product Details</h5>
          <p class="card-text">View all product specifications and suppliers.</p>
          <a href="product-details.jsp" class="btn btn-outline-primary">Explore</a>
        </div>
      </div>
    </div>
    <div class="col-md-4">
      <div class="card shadow">
        <div class="card-body">
          <img src="https://cdn-icons-png.flaticon.com/512/263/263142.png" alt="Cart" class="img-fluid rounded mb-3" />
          <h5 class="card-title">🛍️ Cart</h5>
          <p class="card-text">Manage items you’ve added for checkout.</p>
          <a href="cart.jsp" class="btn btn-outline-primary">Go to Cart</a>
        </div>
      </div>
    </div>
    <div class="col-md-4">
      <div class="card shadow">
        <div class="card-body">
          <img src="https://cdn-icons-png.flaticon.com/512/4299/4299784.png" alt="Billing" class="img-fluid rounded mb-3" />
          <h5 class="card-title">💳 Billing</h5>
          <p class="card-text">View past bills and generate new receipts.</p>
          <a href="billing.jsp" class="btn btn-outline-primary">Billing Center</a>
        </div>
      </div>
    </div>
  </div>
</div>

<div class="footer">
  &copy; 2025 Shopping Zone | 🛍️ Built on trust, powered by smiles.
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>

