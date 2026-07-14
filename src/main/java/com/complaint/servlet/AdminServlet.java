package com.complaint.servlet;

import java.io.IOException;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import com.complaint.dao.ComplaintDAO;
import com.complaint.model.Complaint;

public class AdminServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");

        if (action.equals("viewAll")) {
            ComplaintDAO dao = new ComplaintDAO();
            List<Complaint> list = dao.getAllComplaints();
            request.setAttribute("complaints", list);
            request.getRequestDispatcher("admin.jsp").forward(request, response);

        } else if (action.equals("updateStatus")) {
            int complaintId = Integer.parseInt(request.getParameter("complaintId"));
            String status = request.getParameter("status");

            ComplaintDAO dao = new ComplaintDAO();
            boolean success = dao.updateStatus(complaintId, status);

            if (success) {
                response.sendRedirect("AdminServlet?action=viewAll");
            } else {
                response.sendRedirect("admin.jsp?error=1");
            }
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }
}