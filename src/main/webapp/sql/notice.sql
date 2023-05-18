-- notice.sql

1) 테이블 생성
create table notice(
     noticeno   number           not null  -- 일련번호
    ,category	  varchar2(2)		 		 not null  -- 카테고리
    ,subject    varchar2(255)    not null  -- 제목
    ,content    varchar2(4000)   not null  -- 내용
    ,regdate    date    default  sysdate   -- 작성일
    ,primary key(noticeno)                 -- noticeno 기본키
);

2) 일련번호 시퀀스 생성
create sequence noticeno_seq;

3) JSP 작업폴더 : notice 생성

4) Package명    : net.notice

5) 자바 클래스 파일명
   net.notice.NoticeDTO
   net.notice.NoticeDAO

2. JSP 파일

1) 공지사항 입력폼   : noticeForm.jsp  
   - 제목, 내용에 빈 문자열이 입력되지 않도록 자바스크립트 유효성 검사 추가

2) 공지사항 추가     : noticeIns.jsp

3) 공지사항 리스트   : noticeList.jsp
   -제목, 작성일 출력

4) 공지사항 상세보기 : noticeRead.jsp

5) 공지사항 삭제     : noticeDel.jsp

6) 공지사항 수정     : noticeUpdate.jsp
 
※ 게시판 소스 참고