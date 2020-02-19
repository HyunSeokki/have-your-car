/*
아이디 새로 만들기
sqlplus sys/oracle as sysdba

create user local_dev
identified by autoever
account unlock;

grant connect, resource to local_dev;

alter user local_dev quota unlimited on users;
GRANT DELETE, INSERT, SELECT, UPDATE ON 테이블 이름 TO 유저(사용자);

*/

--유저정보(로그인)
CREATE TABLE USERIFTB(
  USER_ID VARCHAR2(12) PRIMARY KEY, 
  USER_PWD VARCHAR2(20) NOT NULL
  );
  
COMMENT ON TABLE USERIFTB IS '유저정보';
COMMENT ON COLUMN USERIFTB.USER_ID IS '아이디';
COMMENT ON COLUMN USERIFTB.USER_PWD IS '패스워드';

--자동차
CREATE TABLE CARINFTB(
  CAR_NO NUMBER PRIMARY KEY,
  CAR_SIZE VARCHAR2(10) NOT NULL,
  CAR_TYPE VARCHAR2(20) NOT NULL,
  MILEAGE NUMBER NOT NULL,
  BIRTH DATE NOT NULL,
  CAPACITY NUMBER NOT NULL,
  COST NUMBER NOT NULL,
  LATITUDE FLOAT,
  LONGITUDE FLOAT,
  IMG_SRC VARCHAR2(40)
  );
  
COMMENT ON TABLE CARINFTB IS '차정보';
COMMENT ON COLUMN CARINFTB.CAR_NO IS '식별번호';
COMMENT ON COLUMN CARINFTB.CAR_SIZE IS '차종';
COMMENT ON COLUMN CARINFTB.CAR_TYPE IS '차이름';
COMMENT ON COLUMN CARINFTB.MILEAGE IS '주행거리';
COMMENT ON COLUMN CARINFTB.BIRTH IS '연식';
COMMENT ON COLUMN CARINFTB.CAPACITY IS '인승';
COMMENT ON COLUMN CARINFTB.COST IS '비용/km';
COMMENT ON COLUMN CARINFTB.LATITUDE IS '위도';
COMMENT ON COLUMN CARINFTB.LONGITUDE IS '경도';
COMMENT ON COLUMN CARINFTB.IMG_SRC IS '이미지 경로';

--대여
CREATE TABLE CARRENTB(
  RENT_NO NUMBER PRIMARY KEY,
  CAR_NO NUMBER NOT NULL,
  USER_ID VARCHAR2(12) NOT NULL,
  RENT_DATE VARCHAR2(14) NOT NULL,
  RETURN_DATE VARCHAR2(14)
  );

COMMENT ON TABLE CARRENTB IS '대여정보';
COMMENT ON COLUMN CARRENTB.RENT_NO IS '대여번호';
COMMENT ON COLUMN CARRENTB.CAR_NO IS '식별번호';
COMMENT ON COLUMN CARRENTB.USER_ID IS '아이디';
COMMENT ON COLUMN CARRENTB.RENT_DATE IS '대여날짜';
COMMENT ON COLUMN CARRENTB.RETURN_DATE IS '반납날짜';

--시동
CREATE TABLE ACTIVATB(
  CAR_NO NUMBER PRIMARY KEY,
  START_YN VARCHAR2(1) NOT NULL
  );

COMMENT ON TABLE ACTIVATB IS '시동정보';
COMMENT ON COLUMN ACTIVATB.CAR_NO IS '식별번호';
COMMENT ON COLUMN ACTIVATB.START_YN IS '시동여부';

--시동로그
CREATE TABLE ACTLOGTB(
  START_NO NUMBER PRIMARY KEY,
  CAR_NO NUMBER NOT NULL,
  ON_DATE VARCHAR2(14) NOT NULL,
  OFF_DATE VARCHAR2(14)
  );

COMMENT ON TABLE ACTLOGTB IS '시동Log';
COMMENT ON COLUMN ACTLOGTB.START_NO IS '시동번호';
COMMENT ON COLUMN ACTLOGTB.CAR_NO IS '식별번호';
COMMENT ON COLUMN ACTLOGTB.ON_DATE IS '시동ON날짜';
COMMENT ON COLUMN ACTLOGTB.OFF_DATE IS '시동OFF날짜';

--주행정보
CREATE TABLE DRVINFTB(
  RENT_NO NUMBER NOT NULL,
  LATITUDE FLOAT NOT NULL,
  LONGITUDE FLOAT NOT NULL,
  TIMESTAMP VARCHAR2(14) NOT NULL
  );

COMMENT ON TABLE DRVINFTB IS '주행정보';
COMMENT ON COLUMN DRVINFTB.RENT_NO IS '대여번호';
COMMENT ON COLUMN DRVINFTB.LATITUDE IS '위도';
COMMENT ON COLUMN DRVINFTB.LONGITUDE IS '경도';
COMMENT ON COLUMN DRVINFTB.TIMESTAMP IS '시간';

--Sequence
CREATE SEQUENCE CAR_NO_SEQ
START WITH 1
INCREMENT BY 1
MINVALUE 1
MAXVALUE 999
NOCYCLE
CACHE 1
NOORDER;

CREATE SEQUENCE RENT_NO_SEQ
START WITH 1
INCREMENT BY 1
MINVALUE 1
MAXVALUE 999
NOCYCLE
CACHE 1
NOORDER; 

CREATE SEQUENCE START_NO_SEQ
START WITH 1
INCREMENT BY 1
MINVALUE 1
MAXVALUE 999
NOCYCLE
CACHE 1
NOORDER; 
--DROP SEQUENCE CAR_NO_SEQ;
--DROP SEQUENCE RENT_NO_SEQ;

INSERT INTO USERIFTB VALUES(
  'TEST', -- 아이디
  '1234' -- 비밀번호
  );
  
INSERT INTO CARINFTB VALUES( 
  CAR_NO_SEQ.NEXTVAL, -- 식별번호
  '경차', -- 차종
  '소나타', -- 차이름
  1000, -- 주행거리
  TO_CHAR(SYSDATE,'YYYY/MM' )|| '01', -- 연식
  4, -- 인승
  1000, -- 비용/km
  10.0, -- 위도
  40.0  -- 경도
  );
 
INSERT INTO CARRENTB VALUES(
  RENT_NO_SEQ.NEXTVAL, -- 대여번호
  1, -- 식별번호
  'TEST', -- 아이디
  TO_CHAR(SYSDATE,'YYYYMMDDHH24MISS'), -- 대여날짜
  NULL -- 반납날짜
  );

INSERT INTO ACTIVATB VALUES(
  1, -- 식별번호
  'N' -- 시동여부
  );
  
INSERT INTO ACTLOGTB VALUES(
  START_NO_SEQ.NEXTVAL, -- 시동번호
  1, -- 식별번호
  TO_CHAR(SYSDATE,'YYYYMMDDHH24MISS'), -- 시동On
  NULL -- 시동Off
  ); 
  
INSERT INTO DRVINFTB VALUES(
  1, -- 대여번호
  40.0, -- 위도
  20.0, -- 경도
  TO_DATE(SYSDATE,'YYYYMMDDHH24MISS') -- 시간
  );
  
-- 트리거 추가
-- 오류 시 CMD에서 GRANT DELETE, INSERT, SELECT, UPDATE ON LOCAL_DEV.CARINFTB TO LOCAL_DEV;
CREATE OR REPLACE TRIGGER ADD_CARNO
AFTER 
INSERT ON LOCAL_DEV.CARINFTB
FOR EACH ROW
  BEGIN
    INSERT INTO LOCAL_DEV.ACTIVATB VALUES(:NEW.CAR_NO,'N');
  END;