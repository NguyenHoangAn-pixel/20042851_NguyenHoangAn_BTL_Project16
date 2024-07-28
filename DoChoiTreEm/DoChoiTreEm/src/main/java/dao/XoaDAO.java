package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import entities.DoChoiTreEm;
import jdbc.DatabaseConnection;


public class XoaDAO {

   
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
                doChoiTreEm.setAnh(rs.getBinaryStream("anh"));
                doChoiTreEmList.add(doChoiTreEm);
            }
        }
        return doChoiTreEmList;
    }

    
    public void deleteDoChoiTreEm(String maDoChoi) throws SQLException {
        String sql = "DELETE FROM DoChoiTreEm WHERE maDoChoi = ?";
        try (Connection conn = DatabaseConnection.initializeDatabase();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, maDoChoi);
            pstmt.executeUpdate();
        }
    }
}
