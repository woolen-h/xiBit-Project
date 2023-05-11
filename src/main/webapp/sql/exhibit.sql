--전시정보 테이블
CREATE TABLE exh_info (
   excode     VARCHAR2(10)   NOT NULL
  ,bcode      VARCHAR2(10)   NOT NULL
  ,explace    VARCHAR2(10)   NOT NULL
  ,exname     VARCHAR2(50)   NOT NULL
  ,author     VARCHAR2(50)   NOT NULL
  ,exstart    DATE           NOT NULL
  ,exend      DATE  		 NOT NULL   
  ,excnt      NUMBER(4)      NOT NULL
  ,price      NUMBER(10)     NOT NULL
  ,tel        VARCHAR2(14)   NOT NULL
  ,contents   CLOB           NOT NULL
  ,PRIMARY KEY(excode)
);

--시퀀스
create sequence exh_info_seq;


--전시이미지 테이블
CREATE TABLE exh_image(
     imageld       NUMBER(10)   NOT NULL
    ,excode        VARCHAR2(10) NOT NULL
    ,originName    VARCHAR2(50) NOT NULL
    ,newName       VARCHAR2(20) NOT NULL
    ,imagePath     VARCHAR2(50) NOT NULL
    ,PRIMARY KEY(imageld)
);

--조회(전시정보테이블)
SELECT excode, bcode, explace, exname, author, exstart, exend, excnt, price, tel, contents
FROM exh_info
ORDER BY exstart DESC

--현재 전시중인 전시 조회 (이미지명, 전시명) --x
SELECT info.exname, image.originName
FROM exh_info info JOIN exh_image image
ON info.excode = image.excode
WHERE MONTH

--상세보기
SELECT excode, explace, exname, contents, author, exstart, exend, excnt, price, tel
FROM exh_info
WHERE excode = ?

--수정
UPDATE exh_info
SET excode=?, explace=?, exname=?, contents=?, author=?, exstart=?, exend=?, excnt=?, price=?, tel=?
WHERE excode = ?