oracle sql
-- tbl_patient
CREATE TABLE TBL_PATIENT_202004 (
    P_NO CHAR(4) PRIMARY KEY,
    P_NAME VARCHAR2(20),
    P_BIRTH CHAR(8),
    P_GENDER CHAR(1),
    P_TEL1 CHAR(3),
    P_TEL2 CHAR(4),
    P_TEL3 CHAR(4),
    P_CITY CHAR(2)
);

INSERT INTO TBL_PATIENT_202004 VALUES('1001', '김환자', '19850301', 'M', '010', '2222', '0001', '10');
INSERT INTO TBL_PATIENT_202004 VALUES('1002', '이환자', '19900301', 'M', '010', '2222', '0002', '20');
INSERT INTO TBL_PATIENT_202004 VALUES('1003', '박환자', '19770301', 'F', '010', '2222', '0003', '30');
INSERT INTO TBL_PATIENT_202004 VALUES('1004', '조환자', '19650301', 'F', '010', '2222', '0004', '10');
INSERT INTO TBL_PATIENT_202004 VALUES('1005', '황환자', '19400301', 'M', '010', '2222', '0005', '40');
INSERT INTO TBL_PATIENT_202004 VALUES('1006', '양환자', '19440301', 'F', '010', '2222', '0006', '40');
INSERT INTO TBL_PATIENT_202004 VALUES('1007', '허환자', '19760301', 'F', '010', '2222', '0007', '10');


-- tbl_lab_test_202004
CREATE TABLE TBL_LAB_TEST_202004 (
    T_CODE CHAR(4) PRIMARY KEY,
    T_NAME VARCHAR2(20)
);

INSERT INTO TBL_LAB_TEST_202004 VALUES('T001', '결핵');
INSERT INTO TBL_LAB_TEST_202004 VALUES('T002', '장티푸스');
INSERT INTO TBL_LAB_TEST_202004 VALUES('T003', '수두');
INSERT INTO TBL_LAB_TEST_202004 VALUES('T004', '홍역');
INSERT INTO TBL_LAB_TEST_202004 VALUES('T005', '콜레라');


-- tbl_result_202004
CREATE TABLE TBL_RESULT_202004 (
    P_NO CHAR(4),
    T_CODE CHAR(4),
    T_SDATE DATE,
    T_STATUS CHAR(1),
    T_LDATE DATE,
    T_RESULT CHAR(1),
    PRIMARY KEY(P_NO, T_CODE, T_SDATE)
);

INSERT INTO TBL_RESULT_202004 VALUES('1001', 'T001', '2020-01-01', '1', '2020-01-02', 'X');
INSERT INTO TBL_RESULT_202004 VALUES('1002', 'T002', '2020-01-01', '2', '2020-01-02', 'P');
INSERT INTO TBL_RESULT_202004 VALUES('1003', 'T003', '2020-01-01', '2', '2020-01-02', 'N');
INSERT INTO TBL_RESULT_202004 VALUES('1004', 'T004', '2020-01-01', '2', '2020-01-02', 'P');
INSERT INTO TBL_RESULT_202004 VALUES('1005', 'T005', '2020-01-01', '2', '2020-01-02', 'P');
INSERT INTO TBL_RESULT_202004 VALUES('1006', 'T001', '2020-01-01', '2', '2020-01-02', 'N');
INSERT INTO TBL_RESULT_202004 VALUES('1007', 'T002', '2020-01-01', '2', '2020-01-02', 'P');
INSERT INTO TBL_RESULT_202004 VALUES('1005', 'T003', '2020-01-01', '2', '2020-01-02', 'P');
INSERT INTO TBL_RESULT_202004 VALUES('1006', 'T004', '2020-01-01', '2', '2020-01-02', 'N');
INSERT INTO TBL_RESULT_202004 VALUES('1007', 'T005', '2020-01-01', '2', '2020-01-02', 'N');


-- city_code_tbl_02
create table city_code_tbl_02 (
    city char(2) primary key,
    city_name varchar2(20),
    idate date
);

insert into city_code_tbl_02 values('10', '서울', sysdate);
insert into city_code_tbl_02 values('20', '대전', sysdate);
insert into city_code_tbl_02 values('30', '대구', sysdate);
insert into city_code_tbl_02 values('40', '광주', sysdate);
insert into city_code_tbl_02 values('50', '성남', sysdate);
insert into city_code_tbl_02 values('60', '수원', sysdate);
insert into city_code_tbl_02 values('70', '분당', sysdate);
insert into city_code_tbl_02 values('80', '용인', sysdate);
insert into city_code_tbl_02 values('90', '과천', sysdate);


SELECT P_NO, P_NAME, 
    SUBSTR(P_BIRTH, 1, 4) || '년' || SUBSTR(P_BIRTH, 5, 2) || '월' || SUBSTR(P_BIRTH, 7, 2) || '일' , 
    CASE WHEN P_GENDER = 'M' THEN '여'
         WHEN P_GENDER = 'F' THEN '남'
         ELSE '중성' END P_GENDER,
    P_TEL1 || '-' || P_TEL2 || '-' || P_TEL3, P_CITY
FROM TBL_PATIENT_202004;
