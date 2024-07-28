package dao;

import entities.DoChoiTreEm;
import jdbc.DatabaseConnection;

import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class ThemDAO {
    private Connection connection;

    public ThemDAO() {
        this.connection = DatabaseConnection.initializeDatabase();
    }

    public void addDoChoiTreEm(DoChoiTreEm doChoiTreEm) {
        String sql = "INSERT INTO DoChoiTreEm (maDoChoi, tenDoChoi, gia, tinhTrang, loaiDoChoi, anh) VALUES (?, ?, ?, ?, ?, ?)";

        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setString(1, doChoiTreEm.getMaDoChoi());
            statement.setString(2, doChoiTreEm.getTenDoChoi());
            statement.setInt(3, doChoiTreEm.getGia());
            statement.setString(4, doChoiTreEm.getTinhTrang());
            statement.setString(5, doChoiTreEm.getLoaiDoChoi());
            statement.setBlob(6, doChoiTreEm.getAnh());

            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
