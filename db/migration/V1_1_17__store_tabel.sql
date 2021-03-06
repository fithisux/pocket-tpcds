CREATE TABLE IF NOT EXISTS tcpds_2_1_0.store (
s_store_sk integer NOT NULL GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
s_store_id char(16) NOT NULL,
s_rec_start_date date,
s_rec_end_date date,
s_closed_date_sk integer,
s_store_name varchar(50),
s_number_employees integer ,
s_floor_space integer ,
s_hours char(20) ,
S_manager varchar(40) ,
S_market_id integer ,
S_geography_class varchar(100) ,
S_market_desc varchar(100) ,
s_market_manager varchar(40) ,
s_division_id integer,
s_division_name varchar(50) ,
s_company_id integer ,
s_company_name varchar(50) ,
s_street_number varchar(10) ,
s_street_name varchar(60) ,
s_street_type char(15) ,
s_suite_number char(10) ,
s_city varchar(60) ,
s_county varchar(30) ,
s_state char(2) ,
s_zip char(10),
s_country varchar(20),
s_gmt_offset decimal(5,2),
s_tax_percentage decimal(5,2),
CONSTRAINT fk_s_closed_date_sk FOREIGN KEY(s_closed_date_sk) REFERENCES tcpds_2_1_0.date_dim(d_date_sk)
)