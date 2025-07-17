<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="true" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Logging Out...</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" />
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <style>
        body {
            background: linear-gradient(135deg, #7b2cbf, #9d4edd);
            font-family: 'Segoe UI', sans-serif;
            color: white;
            display: flex;
            align-items: center;
            justify-content: center;
            height: 100vh;
        }
    </style>
</head>
<body>
<%
    session.invalidate(); // End user session
%>

<script>
    Swal.fire({
        icon: 'success',
        title: 'Logged Out!',
        text: 'You have been logged out successfully.',
        showConfirmButton: false,
        timer: 1800
    });

    setTimeout(function () {
        window.location.href = 'login.jsp';
    }, 1800);
</script>
</body>
</html>
