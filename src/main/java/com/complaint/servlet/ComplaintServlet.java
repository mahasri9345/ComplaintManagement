package com.complaint.servlet;

import java.io.IOException;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import com.complaint.dao.ComplaintDAO;
import com.complaint.model.Complaint;

public class ComplaintServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        int userId = (int) session.getAttribute("userId");

        String action = request.getParameter("action");

        if (action.equals("raise")) {
            String title = request.getParameter("title");
            String description = request.getParameter("description");
            String category = request.getParameter("category");

            Complaint complaint = new Complaint();
            complaint.setTitle(title);
            complaint.setDescription(description);
            complaint.setCategory(category);
            complaint.setUserId(userId);

            ComplaintDAO dao = new ComplaintDAO();
            boolean success = dao.raiseComplaint(complaint);

            if (success) {
                response.sendRedirect("dashboard.jsp?success=1");
            } else {
                response.sendRedirect("dashboard.jsp?error=1");
            }

        } else if (action.equals("view")) {
            ComplaintDAO dao = new ComplaintDAO();
            List<Complaint> list = dao.getComplaintsByUser(userId);
            request.setAttribute("complaints", list);
            request.getRequestDispatcher("mycomplaints.jsp").forward(request, response);
        }
    }
}