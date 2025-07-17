package com.billing;

import java.io.IOException;
import java.sql.*;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/login")
public class Login extends HttpServlet {

    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        String username = req.getParameter("username");
        String password = req.getParameter("password");

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/billing", "root", "root");

            String sql = "SELECT * FROM users WHERE uname=? AND upwd=?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, username);
            ps.setString(2, password);

            ResultSet rs = ps.executeQuery();

            if(rs.next()) {
                HttpSession session = req.getSession();
                session.setAttribute("username", username);
                req.setAttribute("status", "success");
            } else {
                req.setAttribute("status", "failed");
            }

            con.close();
        } catch(Exception e) {
            e.printStackTrace();
            req.setAttribute("status", "failed");
        }

        req.getRequestDispatcher("login.jsp").forward(req, res);
    }
}
