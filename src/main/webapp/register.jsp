<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Register</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f2f2f2;
            text-align: center;
            padding-top: 50px;
        }
        .form-container {
            background-color: white;
            padding: 30px;
            border-radius: 10px;
            width: 350px;
            margin: auto;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }
        input, select {
            width: 100%;
            padding: 10px;
            margin: 8px 0;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-sizing: border-box;
        }
        button {
            width: 100%;
            padding: 10px;
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
        }
        button:hover { background-color: #45a049; }
        .error { color: red; }
    </style>
</head>
<body>
    <div class="form-container">
        <h2>Register</h2>
        <% if(request.getParameter("error") != null) { %>
            <p class="error">Registration failed! Try again.</p>
        <% } %>
        <form action="RegisterServlet" method="post">
            <input type="text" name="name" placeholder="Full Name" required/>
            <input type="email" name="email" placeholder="Email" required/>
            <input type="password" name="password" placeholder="Password" required/>
            <select name="role">
                <option value="student">Student</option>
                <option value="admin">Admin</option>
            </select>
            <button type="submit">Register</button>
        </form>
        <p>Already have an account? <a href="login.jsp">Login</a></p>
    </div>
</body>
</html>