CREATE TABLE IF NOT EXISTS tcpds_2_1_0.dbgen_version (
dv_version Varchar(16) not null,
dv_create_date date not null,
dv_create_time time not null,
dv_cmdline_args Varchar(200)
)