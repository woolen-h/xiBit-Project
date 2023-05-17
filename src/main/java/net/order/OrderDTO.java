package net.order;

public class OrderDTO {
	private String mid;
	private String ordernum;
	private String excode;
	private int amount;
	private int price;
	
	public OrderDTO() {}

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

	public String getExcode() {
		return excode;
	}

	public void setExcode(String excode) {
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
				+ ", price=" + price + "]";
	}
	
	
	
}
