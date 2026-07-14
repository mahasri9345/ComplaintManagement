<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Login</title>
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
        input {
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
            background-color: #2196F3;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
        }
        button:hover { background-color: #1976D2; }
        .error { color: red; }
    </style>
</head>
<body>
    <div class="form-container">
        <h2>Login</h2>
        <% if(request.getParameter("error") != null) { %>
            <p class="error">Invalid email or password!</p>
        <% } %>
        <form action="LoginServlet" method="post">
            <input type="email" name="email" placeholder="Email" required/>
            <input type="password" name="password" placeholder="Password" required/>
            <button type="submit">Login</button>
        </form>
        <p>Don't have an account? <a href="register.jsp">Register</a></p>
    </div>
</body>
</html>