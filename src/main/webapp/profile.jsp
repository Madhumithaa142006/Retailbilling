<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*, jakarta.servlet.http.*, jakarta.servlet.*" %>
<%@ page session="true" %>

<%
    String username = (String) session.getAttribute("username");
    if (username == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    Connection con = null;
    PreparedStatement pst = null;
    ResultSet rs = null;
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>User Profile | Purple Billing</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"/>
    <style>
        body {
            background: linear-gradient(135deg, #7b2cbf, #9d4edd);
            font-family: 'Segoe UI', sans-serif;
            color: white;
        }
        .profile-card {
            background-color: rgba(255, 255, 255, 0.15);
            backdrop-filter: blur(10px);
            border-radius: 20px;
            padding: 40px;
            margin-top: 100px;
            color: #fff;
            box-shadow: 0 0 20px rgba(0,0,0,0.4);
        }
        h2 {
            color: #ffd6ff;
        }
        .profile-detail {
            font-size: 1.2rem;
            margin-bottom: 10px;
        }
        .btn-home {
            background-color: #a855f7;
            border: none;
            margin-top: 20px;
        }
        .btn-home:hover {
            background-color: #9333ea;
        }
    </style>
</head>
<body>

<div class="container">
    <div class="profile-card text-center mx-auto" style="max-width:500px;">
        <h2>👤 User Profile</h2>
        <hr style="background-color:#fff; opacity:0.2;">
        <%
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                con = DriverManager.getConnection("jdbc:mysql://localhost:3306/billing", "root", "root");
                pst = con.prepareStatement("SELECT * FROM users WHERE uname=?");
                pst.setString(1, username);
                rs = pst.executeQuery();
                if (rs.next()) {
        %>
        <div class="profile-detail"><b>Name:</b> <%= rs.getString("uname") %></div>
        <div class="profile-detail"><b>Email:</b> <%= rs.getString("uemail") %></div>
        <div class="profile-detail"><b>Mobile:</b> <%= rs.getString("umobile") %></div>
        <%
                } else {
        %>
        <div class="alert alert-warning mt-3">User details not found.</div>
        <%
                }
            } catch(Exception e) {
        %>
        <div class="alert alert-danger">Error: <%= e.getMessage() %></div>
        <%
            } finally {
                if (rs != null) rs.close();
                if (pst != null) pst.close();
                if (con != null) con.close();
            }
        %>
        <a href="index.jsp" class="btn btn-home btn-lg">🏠 Back to Home</a>
    </div>
</div>

</body>
</html>


