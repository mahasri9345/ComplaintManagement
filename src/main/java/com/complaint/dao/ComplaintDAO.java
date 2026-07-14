package com.complaint.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import com.complaint.model.Complaint;

public class ComplaintDAO {

    public boolean raiseComplaint(Complaint complaint) {
        try {
            Connection con = DBConnection.getConnection();
            String sql = "INSERT INTO complaints (title, description, category, status, user_id) VALUES (?, ?, ?, 'Pending', ?)";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, complaint.getTitle());
            ps.setString(2, complaint.getDescription());
            ps.setString(3, complaint.getCategory());
            ps.setInt(4, complaint.getUserId());
            int rows = ps.executeUpdate();
            return rows > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    public List<Complaint> getComplaintsByUser(int userId) {
        List<Complaint> list = new ArrayList<>();
        try {
            Connection con = DBConnection.getConnection();
            String sql = "SELECT * FROM complaints WHERE user_id=?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, userId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Complaint c = new Complaint();
                c.setId(rs.getInt("id"));
                c.setTitle(rs.getString("title"));
                c.setDescription(rs.getString("description"));
                c.setCategory(rs.getString("category"));
                c.setStatus(rs.getString("status"));
                c.setCreatedDate(rs.getString("created_date"));
                list.add(c);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public List<Complaint> getAllComplaints() {
        List<Complaint> list = new ArrayList<>();
        try {
            Connection con = DBConnection.getConnection();
            String sql = "SELECT * FROM complaints";
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Complaint c = new Complaint();
                c.setId(rs.getInt("id"));
                c.setTitle(rs.getString("title"));
                c.setDescription(rs.getString("description"));
                c.setCategory(rs.getString("category"));
                c.setStatus(rs.getString("status"));
                c.setCreatedDate(rs.getString("created_date"));
                c.setUserId(rs.getInt("user_id"));
                list.add(c);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public boolean updateStatus(int complaintId, String status) {
        try {
            Connection con = DBConnection.getConnection();
            String sql = "UPDATE complaints SET status=? WHERE id=?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, status);
            ps.setInt(2, complaintId);
            int rows = ps.executeUpdate();
            return rows > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
}