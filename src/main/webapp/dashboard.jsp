<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.complaint.model.User" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Dashboard</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f2f2f2;
            padding: 30px;
        }
        .container {
            background-color: white;
            padding: 30px;
            border-radius: 10px;
            max-width: 600px;
            margin: auto;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }
        input, textarea, select {
            width: 100%;
            padding: 10px;
            margin: 8px 0;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-sizing: border-box;
        }
        button {
            padding: 10px 20px;
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
            margin: 5px;
        }
        button:hover { background-color: #45a049; }
        .btn-blue {
            background-color: #2196F3;
        }
        .btn-red {
            background-color: #f44336;
        }
        .success { color: green; }
        .error { color: red; }
    </style>
</head>
<body>
    <%
        User user = (User) session.getAttribute("user");
        if(user == null) {
            response.sendRedirect("login.jsp");
        }
    %>
    <div class="container">
        <h2>Welcome, <%= user.getName() %>!</h2>
        <% if(request.getParameter("success") != null) { %>
            <p class="success">Complaint raised successfully!</p>
        <% } %>
        <% if(request.getParameter("error") != null) { %>
            <p class="error">Something went wrong! Try again.</p>
        <% } %>

        <h3>Raise a Complaint</h3>
        <form action="ComplaintServlet" method="post">
            <input type="hidden" name="action" value="raise"/>
            <input type="text" name="title" placeholder="Complaint Title" required/>
            <select name="category">
                <option value="Electrical">Electrical</option>
                <option value="Plumbing">Plumbing</option>
                <option value="Cleaning">Cleaning</option>
                <option value="Internet">Internet</option>
                <option value="Other">Other</option>
            </select>
            <textarea name="description" placeholder="Describe your complaint..." rows="4" required></textarea>
            <button type="submit">Raise Complaint</button>
        </form>

        <br>
        <form action="ComplaintServlet" method="post">
            <input type="hidden" name="action" value="view"/>
            <button type="submit" class="btn-blue">View My Complaints</button>
        </form>

        <form action="LogoutServlet" method="post">
            <button type="submit" class="btn-red">Logout</button>
        </form>
    </div>
</body>
</html>