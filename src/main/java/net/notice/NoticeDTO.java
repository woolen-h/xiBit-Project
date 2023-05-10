package net.notice;

public class NoticeDTO {
	
	// 기본 생성자
	public NoticeDTO() {} // end

	private int noticeno; // 일련번호
	private String category; // 카테고리
	private String subject; // 제목
	private String content; // 내용
	private String regdate; // 작성일
	
	public int getNoticeno() {
		return noticeno;
	}
	public void setNoticeno(int noticeno) {
		this.noticeno = noticeno;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	
	@Override
	public String toString() {
		return "NoticeDTO [noticeno=" + noticeno + ", category=" + category + ", subject=" + subject + ", content="
				+ content + ", regdate=" + regdate + "]";
	}
} // class end