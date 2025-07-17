<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Login | Shopping Zone</title>

<!-- Google Fonts, Bootstrap & Font Awesome -->
<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;600&display=swap" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@sweetalert2/theme-dark@5/dark.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

<style>
    body {
        background: linear-gradient(rgba(123,44,191,0.8), rgba(157,78,237,0.8)), url('images/bg.jpg') no-repeat center center/cover;
        font-family: 'Poppins', sans-serif;
        height: 100vh;
        margin: 0;
        display: flex;
        align-items: center;
        justify-content: center;
        overflow: hidden;
    }

    .card {
        background: rgba(255, 255, 255, 0.12);
        backdrop-filter: blur(16px);
        border: 2px solid rgba(255, 255, 255, 0.2);
        padding: 50px 40px;
        border-radius: 20px;
        box-shadow: 0 8px 32px rgba(0,0,0,0.4);
        width: 100%;
        max-width: 420px;
        color: #fff;
        text-align: center;
        animation: fadeIn 1s ease-out;
    }

    @keyframes fadeIn {
        from {opacity: 0; transform: translateY(10px);}
        to {opacity: 1; transform: translateY(0);}
    }

    .card h3 {
        margin-bottom: 30px;
        font-weight: 600;
        font-size: 28px;
    }

    .form-control {
        background: rgba(255,255,255,0.08);
        border: 1px solid #d9baff;
        color: #fff;
        border-radius: 12px;
        padding: 14px;
        transition: 0.3s;
        box-shadow: none;
    }

    .form-control::placeholder {
        color: #e2d5ff;
    }

    .form-control:focus {
        box-shadow: 0 0 12px #bb9dff;
        border-color: #c084fc;
        background: rgba(255,255,255,0.12);
    }

    .input-icon {
        position: absolute;
        left: 14px;
        top: 50%;
        transform: translateY(-50%);
        color: #d2bcff;
    }

    .input-group {
        position: relative;
        margin-bottom: 20px;
    }

    .form-control.icon-padding {
        padding-left: 42px;
    }

    .btn-purple {
        background: #9333ea;
        border: none;
        width: 100%;
        padding: 12px;
        font-size: 16px;
        border-radius: 12px;
        font-weight: 600;
        color: white;
        transition: background 0.3s, transform 0.2s;
    }

    .btn-purple:hover {
        background: #7e22ce;
        transform: scale(1.05);
    }

    .register-link {
        margin-top: 20px;
        display: block;
        color: #e0c9ff;
        text-decoration: none;
        font-size: 15px;
    }

    .register-link:hover {
        text-decoration: underline;
    }
</style>
</head>
<body>

<input type="hidden" id="status" value="<%= request.getAttribute("status") %>">

<div class="card">
    <h3>Welcome Back 👋</h3>
    <form method="post" action="login">
        <div class="input-group">
            <i class="fa fa-user input-icon"></i>
            <input type="text" id="username" name="username" class="form-control icon-padding" placeholder="Username" required />
        </div>
        <div class="input-group">
            <i class="fa fa-lock input-icon"></i>
            <input type="password" id="password" name="password" class="form-control icon-padding" placeholder="Password" required />
        </div>
        <button type="submit" class="btn btn-purple">Login</button>
    </form>
    <a href="registration.jsp" class="register-link">Don't have an account? Register</a>
</div>

<script>
const status = document.getElementById("status").value;

if(status === "success"){
    Swal.fire({
        icon: 'success',
        title: 'Login Successful!',
        text: 'Welcome to Shopping Zone!',
        timer: 1500,
        showConfirmButton: false
    }).then(() => {
        window.location.href = "index.jsp";
    });
}
else if(status === "failed"){
    Swal.fire({
        icon: 'error',
        title: 'Login Failed!',
        text: 'Invalid username or password.'
    });
}
</script>

</body>
</html>
