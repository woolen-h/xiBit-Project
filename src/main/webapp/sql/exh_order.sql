-- order.sql

--테이블 생성
create table exh_order (
	mid 	   varchar2(10)   NOT NULL,
	ordernum   VARCHAR2(10)   NOT NULL,
	excode     VARCHAR2(10)   NOT NULL,
	amount     NUMBER(4)      NOT NULL,
	price      NUMBER(10)     NOT NULL
);

commit;

insert into exh_order(mid, ordernum, excode, amount, price)
values('itwill', '1234', '123', '1', '300');