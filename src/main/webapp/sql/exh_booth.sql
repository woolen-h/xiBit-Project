--booth.sql

1) 테이블 생성
create table exh_booth(
	 bcode	 	 varchar2(10)	 	not null	-- 전시장 코드
	,bname	 	 varchar2(20)	 	not null	-- 전시장 이름
	,baddr	 	 varchar2(50)	 	not null	-- 전시장 지역
	,bdays	 	 varchar2(15)	 	not null	-- 운영요일
	,bhour	 	 varchar2(15)	 	not null	-- 운영시간
	,boffday	 varchar2(15)	 	not null	-- 휴관일
	,btel	 	 varchar2(15)	 	not null	-- 전화번호
);

2) 일련번호 시퀀스 생성
create sequence bcode_seq;

commit;

