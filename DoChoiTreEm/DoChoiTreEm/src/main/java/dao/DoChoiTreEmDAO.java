package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import entities.DoChoiTreEm;
import jdbc.DatabaseConnection;


public class DoChoiTreEmDAO {
	private Connection conn;
	public DoChoiTreEmDAO() {
		conn = DatabaseConnection.initializeDatabase();
	}
    public List<DoChoiTreEm> getAllDoChoiTreEm() throws SQLException {
        List<DoChoiTreEm> doChoiTreEmList = new ArrayList<>();
        String query = "SELECT * FROM DoChoiTreEm";
        try (Connection connection = DatabaseConnection.initializeDatabase();
             PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
            	DoChoiTreEm doChoiTreEm = new DoChoiTreEm();
            	doChoiTreEm.setMaDoChoi(resultSet.getString("MaDoChoi"));
            	doChoiTreEm.setTenDoChoi(resultSet.getString("TenDoChoi"));
            	doChoiTreEm.setGia(resultSet.getInt("Gia"));
            	doChoiTreEm.setTinhTrang(resultSet.getString("TinhTrang"));
                doChoiTreEm.setLoaiDoChoi(resultSet.getString("LoaiDoChoi"));
                doChoiTreEm.setAnh(resultSet.getBinaryStream("Anh"));
                doChoiTreEmList.add(doChoiTreEm);
            }
        }
        return doChoiTreEmList;
    }

    public DoChoiTreEm getDoChoiTreEmByMa(String maDoChoi) throws SQLException {
    	DoChoiTreEm doChoiTreEm = null;
        String query = "SELECT * FROM DoChoiTreEm WHERE MaDoChoi = ?";
        try (Connection connection = DatabaseConnection.initializeDatabase();
             PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            preparedStatement.setString(1, maDoChoi);
            ResultSet resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {
            	doChoiTreEm = new DoChoiTreEm();
            	doChoiTreEm.setMaDoChoi(resultSet.getString("MaDoChoi"));
            	doChoiTreEm.setTenDoChoi(resultSet.getString("TenDoChoi"));
            	doChoiTreEm.setGia(resultSet.getInt("Gia"));
                doChoiTreEm.setTinhTrang(resultSet.getString("TinhTrang"));
                doChoiTreEm.setLoaiDoChoi(resultSet.getString("LoaiDoChoi"));
                doChoiTreEm.setAnh(resultSet.getBinaryStream("Anh"));
            }
        }
        return doChoiTreEm;
    }
}
