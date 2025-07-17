<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <title>Register</title>
  <meta name="viewport" content="width=device-width, initial-scale=1" />

  <!-- Bootstrap -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" />
  <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;600&display=swap" rel="stylesheet" />
  <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" rel="stylesheet" />
  <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

  <style>
    * {
      font-family: 'Poppins', sans-serif;
    }

    body, html {
      height: 100%;
      margin: 0;
      background: linear-gradient(rgba(108, 52, 131, 0.7), rgba(108, 52, 131, 0.7)),
        url('images/bgg.jpg') no-repeat center center/cover;
      display: flex;
      align-items: center;
      justify-content: center;
    }

    .register-card {
      background: rgba(255, 255, 255, 0.1);
      backdrop-filter: blur(12px);
      border-radius: 15px;
      padding: 40px;
      width: 100%;
      max-width: 450px;
      color: #fff;
      box-shadow: 0 0 30px rgba(0, 0, 0, 0.3);
    }

    .form-control {
      background: transparent;
      border: 1px solid #ccc;
      color: #fff;
    }

    .form-control:focus {
      background: transparent;
      color: #fff;
      box-shadow: none;
      border-color: #d0aaff;
    }

    .form-label {
      color: #fff;
    }

    .input-group-text {
      background: transparent;
      border: 1px solid #ccc;
      color: #fff;
    }

    .btn-register {
      background-color: #a855f7;
      border: none;
    }

    .btn-register:hover {
      background-color: #9333ea;
    }

    .links a {
      color: #e0e0ff;
      text-decoration: none;
    }

    .links a:hover {
      text-decoration: underline;
      color: #d0aaff;
    }
  </style>
</head>
<body>
<% String status = (String) request.getAttribute("status"); %>
<input type="hidden" id="status" value="<%= status != null ? status : "" %>" />

<div class="register-card text-white">
  <h3 class="text-center mb-4">Register</h3>
  <form method="post" action="register">
    <div class="mb-3">
      <label for="email" class="form-label">Email</label>
      <div class="input-group">
        <span class="input-group-text"><i class="fas fa-envelope"></i></span>
        <input type="email" class="form-control" id="email" name="email" required />
      </div>
    </div>

    <div class="mb-3">
      <label for="username" class="form-label">Username</label>
      <div class="input-group">
        <span class="input-group-text"><i class="fas fa-user-circle"></i></span>
        <input type="text" class="form-control" id="username" name="username" required />
      </div>
    </div>
    
     <div class="mb-3">
      <label for="fullname" class="form-label">Contact</label>
      <div class="input-group">
        <span class="input-group-text"><i class="fas fa-user"></i></span>
        <input type="text" class="form-control" id="contact" name="contact" required />
      </div>
    </div>

    <div class="mb-3">
      <label for="password" class="form-label">Password</label>
      <div class="input-group">
        <span class="input-group-text"><i class="fas fa-lock"></i></span>
        <input type="password" class="form-control" id="password" name="password" required />
      </div>
    </div>

    <div class="mb-3">
      <label for="confirm_password" class="form-label">Confirm Password</label>
      <div class="input-group">
        <span class="input-group-text"><i class="fas fa-lock"></i></span>
        <input type="password" class="form-control" id="confirm_password" name="confirm_password" required />
      </div>
    </div>

    <div class="d-grid">
      <button type="submit" class="btn btn-register">Register</button>
    </div>

    <div class="mt-3 text-center links">
      Already have an account? <a href="login.jsp">Login</a>
    </div>
  </form>
</div>

<!-- JavaScript -->
<script>
  var status = document.getElementById("status").value;
  if (status === "success") {
    swal("Congrats", "Registered Successfully", "success");
  } else if (status === "failed") {
    swal("Oops!", "Registration Failed. Try again.", "error");
  }
</script>

</body>
</html>
