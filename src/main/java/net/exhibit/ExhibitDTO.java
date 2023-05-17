package net.exhibit;

public class ExhibitDTO {
	private int excode; //시퀀스 사용을 위해 바꿨습니다 String->int
	private String bcode;
	private String exname;
	private String author;
	private String exstart;
	private String exend;   
	private int excnt;
	private int price;
	private String tel;
	private String contents;
	private String filename;
	
	public ExhibitDTO() {}
	
	public int getExcode() {
		return excode;
	}



	public void setExcode(int excode) {
		this.excode = excode;
	}



	public String getBcode() {
		return bcode;
	}



	public void setBcode(String bcode) {
		this.bcode = bcode;
	}


	public String getExname() {
		return exname;
	}



	public void setExname(String exname) {
		this.exname = exname;
	}



	public String getAuthor() {
		return author;
	}



	public void setAuthor(String author) {
		this.author = author;
	}



	public String getExstart() {
		return exstart;
	}



	public void setExstart(String exstart) {
		this.exstart = exstart;
	}



	public String getExend() {
		return exend;
	}



	public void setExend(String exend) {
		this.exend = exend;
	}



	public int getExcnt() {
		return excnt;
	}



	public void setExcnt(int excnt) {
		this.excnt = excnt;
	}



	public int getPrice() {
		return price;
	}



	public void setPrice(int price) {
		this.price = price;
	}



	public String getTel() {
		return tel;
	}



	public void setTel(String tel) {
		this.tel = tel;
	}



	public String getContents() {
		return contents;
	}



	public void setContents(String contents) {
		this.contents = contents;
	}



	public String getFilename() {
		return filename;
	}



	public void setFilename(String filename) {
		this.filename = filename;
	}

	@Override
	public String toString() {
		return "ExhibitDTO [excode=" + excode + ", bcode=" + bcode + ", exname=" + exname + ", author=" + author
				+ ", exstart=" + exstart + ", exend=" + exend + ", excnt=" + excnt + ", price=" + price + ", tel=" + tel
				+ ", contents=" + contents + ", filename=" + filename + "]";
	}


}
