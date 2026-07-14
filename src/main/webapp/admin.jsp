<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.complaint.model.Complaint" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Admin Dashboard</title>
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
            max-width: 900px;
            margin: auto;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }
        table {
            width: 100%;
            border-collapse: collapse;
        }
        th, td {
            padding: 10px;
            border: 1px solid #ccc;
            text-align: left;
        }
        th { background-color: #2196F3; color: white; }
        tr:nth-child(even) { background-color: #f9f9f9; }
        select {
            padding: 5px;
            border-radius: 5px;
        }
        button {
            padding: 5px 15px;
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
        button:hover { background-color: #45a049; }
        .btn-red {
            background-color: #f44336;
            padding: 10px 20px;
            font-size: 16px;
        }
        .status-pending { color: orange; font-weight: bold; }
        .status-progress { color: blue; font-weight: bold; }
        .status-resolved { color: green; font-weight: bold; }
    </style>
</head>
<body>
    <%
        if(session.getAttribute("user") == null) {
            response.sendRedirect("login.jsp");
        }
    %>
    <div class="container">
        <h2>Admin Dashboard - All Complaints</h2>

        <%
            List<Complaint> complaints = (List<Complaint>) request.getAttribute("complaints");
            if(complaints == null || complaints.isEmpty()) {
        %>
            <p>No complaints found!</p>
        <% } else { %>
            <table>
                <tr>
                    <th>#</th>
                    <th>Title</th>
                    <th>Category</th>
                    <th>Current Status</th>
                    <th>Date</th>
                    <th>Update Status</th>
                </tr>
                <%
                    int i = 1;
                    for(Complaint c : complaints) {
                        String statusClass = "";
                        if(c.getStatus().equals("Pending")) statusClass = "status-pending";
                        else if(c.getStatus().equals("In Progress")) statusClass = "status-progress";
                        else if(c.getStatus().equals("Resolved")) statusClass = "status-resolved";
                %>
                <tr>
                    <td><%= i++ %></td>
                    <td><%= c.getTitle() %></td>
                    <td><%= c.getCategory() %></td>
                    <td class="<%= statusClass %>"><%= c.getStatus() %></td>
                    <td><%= c.getCreatedDate() %></td>
                    <td>
                        <form action="AdminServlet" method="post">
                            <input type="hidden" name="action" value="updateStatus"/>
                            <input type="hidden" name="complaintId" value="<%= c.getId() %>"/>
                            <select name="status">
                                <option value="Pending">Pending</option>
                                <option value="In Progress">In Progress</option>
                                <option value="Resolved">Resolved</option>
                            </select>
                            <button type="submit">Update</button>
                        </form>
                    </td>
                </tr>
                <% } %>
            </table>
        <% } %>

        <br>
        <form action="LogoutServlet" method="post">
            <button class="btn-red" type="submit">Logout</button>
        </form>
    </div>
</body>
</html>