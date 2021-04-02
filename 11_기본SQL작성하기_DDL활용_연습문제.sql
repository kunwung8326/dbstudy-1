-- 1. 국가(nation) 테이블
CREATE TABLE nation
(
    nation_code NUMBER(3),
    nation_name VARCHAR2(30),
    nation_prev_rank NUMBER,
    nation_curr_rank NUMBER,
    nation_parti_person NUMBER,
    nation_parti_event NUMBER
);

-- 2. 종목(event) 테이블
CREATE TABLE event
(
    event_code NUMBER(5),
    event_name VARCHAR2(30),
    event_info VARCHAR2(1000),
    event_first_year NUMBER(4)
);

-- 3. 선수(player) 테이블
CREATE TABLE player
(
    player_code NUMBER(5),
    nation_code NUMBER(3),
    event_code NUMBER(5),
    player_name VARCHAR2(30),
    player_age NUMBER(3),
    player_rank NUMBER
);

-- 4. 일정(schedule) 테이블
CREATE TABLE schedule
(
    nation_code NUMBER(3),
    event_code NUMBER(5),
    schedule_info VARCHAR2(1000),
    schedule_begin DATE,
    schedule_end DATE
);



-- 각 테이블에 기본키를 추가하기
ALTER TABLE nation ADD CONSTRAINT nation_pk PRIMARY KEY(nation_code);
ALTER TABLE event ADD CONSTRAINT event_pk PRIMARY KEY(event_code);
ALTER TABLE player ADD CONSTRAINT player_pk PRIMARY KEY(player_code);
ALTER TABLE schedule ADD CONSTRAINT schedule_pk PRIMARY KEY(nation_code, event_code);





















