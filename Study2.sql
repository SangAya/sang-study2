/*1. 요구사항 분석
	-펫
	펫의 종류, 이름, 나이, 병명

	-주인
	이름, 나이, 주소, 핸드폰 번호

2. 개념적 설계
	펫				주인
	-----------------------
	등록 번호			고객 번호
	펫의 종류			이름
	펫의 이름			나이
	펫의 나이			주소
	펫의 병명			핸드폰번호

3. 논리적 설계
	펫				주인
	-----------------------
	등록 번호P			고객 번호P
	-----------------------
	펫의 종류			이름
	펫의 이름			나이
	펫의 나이			주소
	펫의 병명			핸드폰번호U
	고객 번호F		

4. 물리적 설계
	OWNER
	-----------------------
	NUM : NUMBER
	-----------------------
	NAME : VARCHAR2(1000)
	AGE : NUMBER(3)
	ADDRESS : VARCHAR2(1000)
	PHONE : VARCHAR2(100)
	
	
	PET
	-----------------------
	registNum : NUMBER
	-----------------------
	petType : VARCHAR2(1000)
	name : VARCHAR2(1000)
	age : NUMBER(3)
	reason : VARCHAR2(3000)
	num : NUMBER
*/	
-- 5. 구현
CREATE TABLE owner(
num NUMBER PRIMARY key,
name varchar2(1000),
age number(3),
address varchar2(1000),
phone varchar2(100) unique
)

CREATE TABLE pet(
registNum NUMBER PRIMARY key,
petType varchar2(1000),
age number(3),
reason varchar2(3000),
num NUMBER,
CONSTRAINT fk_num FOREIGN KEY(NUM) REFERENCES owner(NUM)
)

ALTER TABLE TBL_owner ADD CONSTRAINT PK_FLOWER PRIMARY KEY(NAME, COLOR);
ALTER TABLE TBL_POT ADD CONSTRAINT FK_POT FOREIGN KEY(NAME, COLOR)


DROP TABLE owner;
DROP TABLE pet;

SELECT * FROM TBL_FLOWER;
SELECT * FROM TBL_POT;
SELECT * FROM OWNER;
SELECT * FROM PET;

SELECT * FROM TBL_STUDENT;

INSERT INTO TBL_STUDENT
(NUM, ID, NAME, MAJOR, BIRTH)
VALUES(1, 'psa123', '박상아', '산경과', TO_DATE('1999-12-04', 'YYYY-MM-DD'));

INSERT INTO TBL_STUDENT
(NUM, ID, NAME, MAJOR, GENDER, BIRTH)
VALUES(2, 'hgd1234', '홍길동', '컴퓨터공학', 'G', TO_DATE('1980-01-01', 'YYYY-MM-DD'));

INSERT INTO TBL_STUDENT
VALUES(3, 'hgd1233', '홍길동', 'M', TO_DATE('1980-01-01', 'YYYY-MM-DD'), '컴퓨터공학');

--stundent테이블 모든 젠더를 m으로 업데이트
UPDATE TBL_STUDENT 
SET GENDER = 'M';

--테이블 내용 전체삭제
--TRUNCATE TABLE TBL_STUDENT;
DELETE FROM TBL_STUDENT;

--tbl_student 에서 이름이 홍길동인 학생 찾기
SELECT * FROM TBL_STUDENT
WHERE NAME = '홍길동';

-- 1번 젠터 F 업데이트
UPDATE TBL_STUDENT 
SET GENDER = 'F'
WHERE NUM = 1;

-- 해킹보안학과에 다니는 홍길동이 자퇴했다.
SELECT NUM FROM TBL_STUDENT
WHERE NAME = '홍길동' AND MAJOR = '해킹보안';

DELETE FROM TBL_STUDENT
WHERE NUM = 2;

--조합키(복합키)
--	두 개 이상의 컬럼을 하나의 PK로 설정
--	PRIMARY KEY(컬럼명1, 컬럼명2)
--	FOREIGN KEY(컬럼명1, 컬럼명2) REFERENCES 부모테이블명(부모컬럼명1, 부모컬럼명2)

ALTER TABLE TBL_POT MODIFY(NUM VARCHAR2(1000));
ALTER TABLE TBL_POT DROP CONSTRAINT FK_POT;
ALTER TABLE TBL_FLOWER DROP CONSTRAINT SYS_C007034;

ALTER TABLE TBL_FLOWER ADD CONSTRAINT PK_FLOWER PRIMARY KEY(NAME, COLOR);
ALTER TABLE TBL_POT ADD CONSTRAINT FK_POT FOREIGN KEY(NAME, COLOR)
REFERENCES TBL_FLOWER(NAME, COLOR);
ALTER TABLE TBL_POT ADD CONSTRAINT FK_POT FOREIGN KEY(NAME, COLOR)
REFERENCES TBL_FLOWER(NAME, COLOR) ON DELETE CASCADE;

ALTER TABLE TBL_POT ADD(potColor VARCHAR2(1000));

--추가
--	장미, 빨간색, 1500원
INSERT INTO TBL_FLOWER
(NAME, COLOR, PRICE)
VALUES('장미', '빨간색', 1500);

--	장미, 핑크색, 1700원
INSERT INTO TBL_FLOWER
(NAME, COLOR, PRICE)
VALUES('장미', '핑크색', 1700);

--	해바라기, 노란색, 3500원
INSERT INTO TBL_FLOWER
(NAME, COLOR, PRICE)
VALUES('해바라기', '노란색', 3500);

SELECT * FROM TBL_FLOWER;

--	APPLE001, GREEN, 사과모양, 장미
INSERT INTO TBL_POT
(NUM, COLOR, SHAPE, NAME, POTCOLOR)
VALUES('APPLE001', '빨간색', '사과모양', '장미', 'GREEN');

INSERT INTO TBL_POT
(NUM, COLOR, SHAPE, NAME, POTCOLOR)
VALUES('APPLE002', '핑크색', '사과모양', '장미', 'GREEN');

--	POT001, WHITE, 원기둥, 해바라기
INSERT INTO TBL_POT
(NUM, COLOR, SHAPE, NAME, POTCOLOR)
VALUES('POT001', '노란색', '원기둥', '해바라기', 'WHITE');

--	POT002, BLACK, 직사각형, 해바라기
INSERT INTO TBL_POT
(NUM, COLOR, SHAPE, NAME, POTCOLOR)
VALUES('POT002', '노란색', '직사각형', '해바라기', 'BLACK');

SELECT * FROM TBL_POT;

--삭제
--	장미꽃 삭제
DELETE FROM TBL_FLOWER
WHERE NAME = '장미';

-- 	1500원보다 비싼 꽃 삭제
DELETE FROM TBL_POT
WHERE NAME = '해바라기';

DELETE FROM TBL_FLOWER
WHERE PRICE > 1500;

-- 	장미꽃을 담을 수 있는 화분 삭제
DELETE FROM TBL_POT
WHERE NAME = '장미';

--수정
--	빨간색 장미 가격 10% 인상
SELECT * FROM TBL_FLOWER
WHERE NAME = '장미' AND COLOR = '빨간색';

UPDATE TBL_FLOWER
SET PRICE = PRICE * 1.1
WHERE NAME = '장미' AND COLOR = '빨간색';

--	핑크색 장미 가격을 100배 인상
SELECT * FROM TBL_FLOWER
WHERE NAME = '장미' AND COLOR = '핑크색';

UPDATE TBL_FLOWER
SET PRICE = PRICE * 100
WHERE NAME = '장미' AND COLOR = '핑크색';

--	직사각형인 화분을 정사각형으로 변경
UPDATE TBL_POT
SET SHAPE = '정사각형'
WHERE SHAPE = '직사각형';

SELECT * FROM TBL_POT;
---------------------------------------------------------------------
SELECT * FROM PLAYER;
--PLAYER 테이블에서 TEAM_ID가 'K01'인 선수 검색
SELECT * FROM PLAYER 
WHERE team_id='K01';

--PLAYER 테이블에서 TEAM_ID가 'K01'이 아닌 선수 검색
SELECT * FROM PLAYER 
WHERE team_id!='K01';

--PLAYER 테이블에서 WEIGHT가 70이상이고 80이하인 선수 검색
SELECT * FROM PLAYER 
WHERE WEIGHT>=80 AND 70<=WEIGHT;

--PLAYER 테이블에서 TEAM_ID가 'K03'이고 HEIGHT가 180미만인 선수 검색
SELECT * FROM PLAYER 
WHERE team_id='K03' AND HEIGHT<180;

--PLAYER 테이블에서 TEAM_ID가 'K06'이고 NICKNAME이 '제리'인 선수 검색
SELECT * FROM PLAYER 
WHERE team_id='K06' AND NICKNAME='제리';


--PLAYER 테이블에서 HEIGHT가 170이상이고 WEIGHT가 80이상인 선수 이름 검색
SELECT PLAYER_NAME FROM PLAYER 
WHERE WEIGHT>=80 AND HEIGHT>=170;

--STADIUM 테이블에서 SEAT_COUNT가 30000초과이고 41000이하인 경기장 검색
SELECT STADIUM_NAME FROM STADIUM
WHERE SEAT_COUNT>30000 AND SEAT_COUNT>=41000;
--PLAYER 테이블에서 TEAM_ID가 'K02'이거나 'K07'이고 포지션은 'MF'인 선수 검색
SELECT * FROM PLAYER
WHERE (team_id='K02'OR TEAM_ID ='K07') AND "POSITION" ='MF';

--PLAYER 테이블에서 TEAM_ID가 'K01'인 선수 이름을 내 이름으로 바꾸기
-- set에 변경할 항목을 적는 것
UPDATE PLAYER
SET   PLAYER_NAME='상아'
WHERE  TEAM_ID='K01';

SELECT * FROM PLAYER
WHERE PLAYER_NAME='상아';

SELECT * FROM PLAYER
WHERE TEAM_ID='K01';

--PLAYER 테이블에서 POSITION이 'MF'인 선수 삭제하기
DELETE player 
WHERE "POSITION"='MF';

SELECT * FROM PLAYER
WHERE "POSITION"='MF';

--PLAYER 테이블에서 HEIGHT가 180이상인 선수 삭제하기
DELETE player
WHERE height>=180;

SELECT * FROM PLAYER
WHERE height>=180;