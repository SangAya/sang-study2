-- ���� �ּ�
/*
 * 	���� �ּ�
 */

CREATE TABLE TBL_MEMBER(
	NAME VARCHAR2(500),
	AGE NUMBER
);

DROP TABLE TBL_MEMBER;

-- �ڵ��� ���̺� ����
-- �ڵ��� ��ȣ
-- �ڵ��� �귣��
-- ��ó�¥
-- ����
-- ����

CREATE TABLE tbl_car(
CARNUM NUMBER,
BRADN VARCHAR2(500),
CARDATE DATE,
COLOR VARCHAR2(500),
PRICE NUMBER
);


ALTER TABLE tbl_car ADD CONSTRAINT PK_car PRIMARY KEY(CARNUM);
ALTER TABLE TBL_CAR DROP CONSTRAINT PK_CAR;

DROP TABLE TBL_CAR;

--���� ���̺� ����
--	������ȣ
--	����
--	����
--	����

CREATE TABLE tbl_animal(
num NUMBER,
kind varchar2(500),
age NUMBER,
eat varchar2(500)
);

--CREATE TABLE TBL_ANIMAL(
--	ID NUMBER /*PRIMARY KEY*/,
--	"TYPE" VARCHAR2(1000),
--	AGE NUMBER(3),
--	FEED VARCHAR2(1000)
--);

SELECT * FROM tbl_animal;

--�������� �߰�(PK)
ALTER TABLE tbl_animal ADD CONSTRAINT PK_animal PRIMARY KEY(num);

--�������� ����(PK)
ALTER TABLE TBL_ANIMAL DROP CONSTRAINT PK_ANIMAL;

--�÷� �߰�
ALTER TABLE TBL_ANIMAL ADD(GENDER CHAR(1));

--�÷� �̸� ����
ALTER TABLE TBL_ANIMAL RENAME COLUMN num TO id;

--�÷� ����
ALTER TABLE TBL_ANIMAL DROP COLUMN GENDER;

--�÷� ����
ALTER TABLE TBL_ANIMAL MODIFY(FEED VARCHAR2(2000));
ALTER TABLE TBL_ANIMAL MODIFY(FEED NUMBER);

--���� ���̺� ����
DROP TABLE TBL_ANIMAL;

--�л� ���̺� ����
--	�л� ��ȣ
--	�л� ���̵�
--	�л� �̸�
--	����
--	����-CHAR
--	�������
--CREATE TABLE TBL_STUDENT(
--	NUM NUMBER /*PRIMARY KEY*/,
--	ID VARCHAR2(1000) /*UNIQUE*/,
--	NAME VARCHAR2(500),
--	MAJOR VARCHAR2(1000),
--	GENDER CHAR(1) DEFAULT 'F' NOT NULL CONSTRAINT BAN_CHAR CHECK(GENDER IN('M','F')),
--	BIRTH DATE CONSTRAINT BAN_DATE CHECK(BIRTH >= TO_DATE('1980-01-01', 'YYYY-MM-DD'))
--);


CREATE  TABLE TBL_STUDENT(
num NUMBER,
id varchar2(500),
name varchar2(500),
gender char(1),
birthday DATE,
major varchar2(500)
);

ALTER TABLE tbl_stt ADD CONSTRAINT pk_stt PRIMARY KEY(num);

--PK�� �л� ��ȣ�� �����Ѵ�.
ALTER TABLE TBL_STUDENT DROP CONSTRAINT SYS_C007003;
ALTER TABLE TBL_STUDENT ADD CONSTRAINT PK_STUDENT PRIMARY KEY(NUM);

--�÷� �̸� ����
--	�л� ���̵� �̸��� �����غ���.
ALTER TABLE TBL_STUDENT RENAME COLUMN studentId TO id;
ALTER TABLE TBL_STUDENT RENAME COLUMN birthday TO birth;

--�÷� �߰�
--	��ģ��ģ���� �÷� �߰�
ALTER TABLE TBL_STUDENT ADD(COUPLE CHAR(1));

--�÷� ����
--��ģ��ģ���� �÷� ����
ALTER TABLE TBL_STUDENT DROP COLUMN COUPLE;

-- ����ũ Ű �߰�
--	�л� ���̵� ����ũ Ű�� �߰�
ALTER TABLE TBL_STUDENT DROP CONSTRAINT SYS_C007004;
ALTER TABLE TBL_STUDENT ADD CONSTRAINT UK_STUDENT UNIQUE(studentId);

-- �л� ���̺� ����
DROP TABLE TBL_STUDENT;

SELECT * fROM TBL_STUDENT;
/*	FLOWER
	--------------------
	NAME : VARCHAR2(1000)
	--------------------
	COLOR : VARCHAR2(500)
	PRICE : NUMBER(10)


	POT
	--------------------
	NUM : NUMBER
	--------------------
	COLOR : VARCHAR2(500)
	SHAPE : VARCHAR2(1000)
	NAME : VARCHAR2(1000) : FK*/

CREATE TABLE TBL_FLOWER(
	NAME VARCHAR2(1000) PRIMARY KEY,
	COLOR VARCHAR2(500),
	PRICE NUMBER(10)
);

CREATE TABLE TBL_POT(
	NUM NUMBER PRIMARY KEY,
	COLOR VARCHAR2(500),
	SHAPE VARCHAR2(1000),
	NAME VARCHAR2(1000),
	CONSTRAINT FK_POT FOREIGN KEY(NAME) REFERENCES TBL_FLOWER(NAME)
);











