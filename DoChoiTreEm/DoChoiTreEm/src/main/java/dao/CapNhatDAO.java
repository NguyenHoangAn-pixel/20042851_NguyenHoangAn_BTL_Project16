package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import jdbc.DatabaseConnection;
import entities.DoChoiTreEm;

public class CapNhatDAO {

  
    public void updateDoChoiTreEm(DoChoiTreEm doChoiTreEm) throws SQLException {
        String sql = "UPDATE DoChoiTreEm SET tenDoChoi = ?, gia = ?, tinhTrang = ?, loaiDoChoi = ? WHERE maDoChoi = ?";
        try (Connection conn = DatabaseConnection.initializeDatabase();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, doChoiTreEm.getTenDoChoi());
            pstmt.setInt(2, doChoiTreEm.getGia());
            pstmt.setString(3, doChoiTreEm.getTinhTrang());
            pstmt.setString(4, doChoiTreEm.getLoaiDoChoi());
            pstmt.setString(5, doChoiTreEm.getMaDoChoi());
            pstmt.executeUpdate();
        }
    }

    
    public List<DoChoiTreEm> getAllDoChoiTreEm() throws SQLException {
        List<DoChoiTreEm> doChoiTreEmList = new ArrayList<>();
        String sql = "SELECT * FROM DoChoiTreEm";
        try (Connection conn = DatabaseConnection.initializeDatabase();
             PreparedStatement pstmt = conn.prepareStatement(sql);
             ResultSet rs = pstmt.executeQuery()) {
            while (rs.next()) {
                DoChoiTreEm doChoiTreEm = new DoChoiTreEm();
                doChoiTreEm.setMaDoChoi(rs.getString("maDoChoi"));
                doChoiTreEm.setTenDoChoi(rs.getString("tenDoChoi"));
                doChoiTreEm.setGia(rs.getInt("gia"));
                doChoiTreEm.setTinhTrang(rs.getString("tinhTrang"));
                doChoiTreEm.setLoaiDoChoi(rs.getString("loaiDoChoi"));
                doChoiTreEmList.add(doChoiTreEm);
            }
        }
        return doChoiTreEmList;
    }
}
