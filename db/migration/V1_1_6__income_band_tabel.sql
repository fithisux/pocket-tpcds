CREATE TABLE IF NOT EXISTS tcpds_2_1_0.income_band (
ib_income_band_sk integer NOT NULL GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
ib_lower_bound integer,
ib_upper_bound integer
)