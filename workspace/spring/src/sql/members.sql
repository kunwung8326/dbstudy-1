drop table boards;
drop table members;

create table members
(
	mno number,  -- 회원번호 (시퀀스 사용)
	mid varchar2(30),  -- 아이디
	mname varchar2(30),  -- 이름
	mdate date  -- 가입일
);

create sequence members_seq
increment by 1
start with 1
nomaxvalue
nominvalue
nocycle
nocache;




