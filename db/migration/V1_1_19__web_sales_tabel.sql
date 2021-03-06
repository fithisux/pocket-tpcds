CREATE TABLE IF NOT EXISTS tcpds_2_1_0.web_sales (
ws_sold_date_sk integer,
ws_sold_time_sk integer,
ws_ship_date_sk integer,
ws_item_sk integer not null,
ws_bill_customer_sk integer,
ws_bill_cdemo_sk integer,
ws_bill_hdemo_sk integer,
ws_bill_addr_sk integer,
ws_ship_customer_sk integer,
ws_ship_cdemo_sk integer,
ws_ship_hdemo_sk integer,
ws_ship_addr_sk integer,
ws_web_page_sk integer,
ws_web_site_sk integer,
ws_ship_mode_sk integer,
ws_warehouse_sk integer,
ws_promo_sk integer,
ws_order_number integer not null,
ws_quantity integer,
ws_wholesale_cost decimal(7,2),
ws_list_price decimal(7,2),
ws_sales_price decimal(7,2),
ws_ext_discount_amt decimal(7,2),
ws_ext_sales_price decimal(7,2),
ws_ext_wholesale_cost decimal(7,2),
ws_ext_list_price decimal(7,2),
ws_ext_tax decimal(7,2),
ws_coupon_amt decimal(7,2),
ws_ext_ship_cost decimal(7,2),
ws_net_paid decimal(7,2),
ws_net_paid_inc_tax decimal(7,2),
ws_net_paid_inc_ship decimal(7,2),
ws_net_paid_inc_ship_tax decimal(7,2),
ws_net_profit decimal(7,2),
PRIMARY KEY (ws_item_sk, ws_order_number),
CONSTRAINT fk_ws_sold_date_sk FOREIGN KEY(ws_sold_date_sk) REFERENCES tcpds_2_1_0.date_dim(d_date_sk),
CONSTRAINT fk_ws_sold_time_sk FOREIGN KEY(ws_sold_time_sk) REFERENCES tcpds_2_1_0.time_dim(t_time_sk),
CONSTRAINT fk_ws_ship_date_sk FOREIGN KEY(ws_ship_date_sk) REFERENCES tcpds_2_1_0.date_dim(d_date_sk),
CONSTRAINT fk_ws_item_sk FOREIGN KEY(ws_item_sk) REFERENCES tcpds_2_1_0.item(i_item_sk),
CONSTRAINT fk_ws_bill_customer_sk FOREIGN KEY(ws_bill_customer_sk) REFERENCES tcpds_2_1_0.customer(c_customer_sk),
CONSTRAINT fk_ws_bill_cdemo_sk FOREIGN KEY(ws_bill_cdemo_sk) REFERENCES tcpds_2_1_0.customer_demographics(cd_demo_sk),
CONSTRAINT fk_ws_bill_hdemo_sk FOREIGN KEY(ws_bill_hdemo_sk) REFERENCES tcpds_2_1_0.household_demographics(hd_demo_sk),
CONSTRAINT fk_ws_bill_addr_sk FOREIGN KEY(ws_bill_addr_sk) REFERENCES tcpds_2_1_0.customer_address(ca_address_sk),
CONSTRAINT fk_ws_ship_customer_sk FOREIGN KEY(ws_ship_customer_sk) REFERENCES tcpds_2_1_0.customer(c_customer_sk),
CONSTRAINT fk_ws_ship_cdemo_sk FOREIGN KEY(ws_ship_cdemo_sk) REFERENCES tcpds_2_1_0.customer_demographics(cd_demo_sk),
CONSTRAINT fk_ws_ship_hdemo_sk FOREIGN KEY(ws_ship_hdemo_sk) REFERENCES tcpds_2_1_0.household_demographics(hd_demo_sk),
CONSTRAINT fk_ws_ship_addr_sk FOREIGN KEY(ws_ship_addr_sk) REFERENCES tcpds_2_1_0.customer_address(ca_address_sk),
CONSTRAINT fk_ws_web_site_sk FOREIGN KEY(ws_web_site_sk) REFERENCES tcpds_2_1_0.web_site(web_site_sk),
CONSTRAINT fk_ws_web_page_sk FOREIGN KEY(ws_web_page_sk) REFERENCES tcpds_2_1_0.web_page(wp_web_page_sk),
CONSTRAINT fk_ws_ship_mode_sk FOREIGN KEY(ws_ship_mode_sk) REFERENCES tcpds_2_1_0.ship_mode(sm_ship_mode_sk),
CONSTRAINT fk_ws_warehouse_sk FOREIGN KEY(ws_warehouse_sk) REFERENCES tcpds_2_1_0.warehouse(w_warehouse_sk),
CONSTRAINT fk_ws_promo_sk FOREIGN KEY(ws_promo_sk) REFERENCES tcpds_2_1_0.promotion(p_promo_sk)
)