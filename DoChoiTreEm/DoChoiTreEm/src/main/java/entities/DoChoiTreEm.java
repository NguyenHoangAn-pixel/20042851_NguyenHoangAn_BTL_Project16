package entities;

import java.io.InputStream;

public class DoChoiTreEm {
	private String maDoChoi;
	private String tenDoChoi;
	private int gia;
	private String tinhTrang;
	private String loaiDoChoi;
	private InputStream anh;
	public DoChoiTreEm() {
		super();
		// TODO Auto-generated constructor stub
	}
	public DoChoiTreEm(String maDoChoi, String tenDoChoi, int gia, String tinhTrang, String loaiDoChoi,
			InputStream anh) {
		super();
		this.maDoChoi = maDoChoi;
		this.tenDoChoi = tenDoChoi;
		this.gia = gia;
		this.tinhTrang = tinhTrang;
		this.loaiDoChoi = loaiDoChoi;
		this.anh = anh;
	}
	public String getMaDoChoi() {
		return maDoChoi;
	}
	public void setMaDoChoi(String maDoChoi) {
		this.maDoChoi = maDoChoi;
	}
	public String getTenDoChoi() {
		return tenDoChoi;
	}
	public void setTenDoChoi(String tenDoChoi) {
		this.tenDoChoi = tenDoChoi;
	}
	public int getGia() {
		return gia;
	}
	public void setGia(int gia) {
		this.gia = gia;
	}
	public String getTinhTrang() {
		return tinhTrang;
	}
	public void setTinhTrang(String tinhTrang) {
		this.tinhTrang = tinhTrang;
	}
	public String getLoaiDoChoi() {
		return loaiDoChoi;
	}
	public void setLoaiDoChoi(String loaiDoChoi) {
		this.loaiDoChoi = loaiDoChoi;
	}
	public InputStream getAnh() {
		return anh;
	}
	public void setAnh(InputStream anh) {
		this.anh = anh;
	}
	
}
