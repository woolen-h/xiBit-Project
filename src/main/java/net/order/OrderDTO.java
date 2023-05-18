package net.order;

public class OrderDTO {
	private String mid;
	private String ordernum;
	private int excode;
	private int amount;
	private int price;
	private String sdate;
	
	public OrderDTO() {}
	
	public String getSdate() {
		return sdate;
	}

	public void setSdate(String sdate) {
		this.sdate = sdate;
	}

	public String getMid() {
		return mid;
	}

	public void setMid(String mid) {
		this.mid = mid;
	}

	public String getOrdernum() {
		return ordernum;
	}

	public void setOrdernum(String ordernum) {
		this.ordernum = ordernum;
	}

	public int getExcode() {
		return excode;
	}

	public void setExcode(int excode) {
		this.excode = excode;
	}

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	@Override
	public String toString() {
		return "OrderDTO [mid=" + mid + ", ordernum=" + ordernum + ", excode=" + excode + ", amount=" + amount
				+ ", price=" + price + ", sdate=" + sdate + "]";
	}

	
	
	
}
