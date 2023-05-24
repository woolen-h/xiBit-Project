package net.zzim;

public class ZzimDTO {

	private String mid;
	private int excode;
	
	public ZzimDTO() {} // end
	
	public String getMid() {
		return mid;
	}
	
	public void setMid(String mid) {
		this.mid = mid;
	}
	
	public int getExcode() {
		return excode;
	}
	
	public void setExcode(int excode) {
		this.excode = excode;
	}

	@Override
	public String toString() {
		return "ZzimDTO [mid=" + mid + ", excode=" + excode + "]";
	}
} // class end