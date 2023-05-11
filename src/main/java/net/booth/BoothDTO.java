package net.booth;

public class BoothDTO {

	
		//기본 생성자
		public BoothDTO() {} //end
		
		private String bcode;		//전시장 코드
		private String bname;		//전시장 이름
		private String baddr;		//전시장 지역
		private String bdays;		//운영 요일
		private String bhour;		//운영 시간
		private String boffday;		//휴관일
		private String btel;		//전화번호
		
		
		
		public String getBcode() {
			return bcode;
		}
		public void setBcode(String bcode) {
			this.bcode = bcode;
		}
		public String getBname() {
			return bname;
		}
		public void setBname(String bname) {
			this.bname = bname;
		}
		public String getBaddr() {
			return baddr;
		}
		public void setBaddr(String baddr) {
			this.baddr = baddr;
		}
		public String getBdays() {
			return bdays;
		}
		public void setBdays(String bdays) {
			this.bdays = bdays;
		}
		public String getBhour() {
			return bhour;
		}
		public void setBhour(String bhour) {
			this.bhour = bhour;
		}
		public String getBoffday() {
			return boffday;
		}
		public void setBoffday(String boffday) {
			this.boffday = boffday;
		}
		public String getBtel() {
			return btel;
		}
		public void setBtel(String btel) {
			this.btel = btel;
		}
		
		
		@Override
		public String toString() {
			return "BoothDTO [bcode=" + bcode + ", bname=" + bname + ", baddr=" + baddr + ", bdays=" + bdays
					+ ", bhour=" + bhour + ", boffday=" + boffday + ", btel=" + btel + "]";
		}
		
	
	
}//class end
