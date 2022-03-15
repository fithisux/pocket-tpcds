CREATE TABLE IF NOT EXISTS tcpds_2_1_0.inventory (
inv_date_sk integer not null,
inv_item_sk integer not null,
inv_warehouse_sk integer not null,
inv_quantity_on_hand integer,
PRIMARY KEY (inv_date_sk, inv_item_sk, inv_warehouse_sk),
CONSTRAINT fk_inv_date_sk FOREIGN KEY(inv_date_sk) REFERENCES tcpds_2_1_0.date_dim(d_date_sk),
CONSTRAINT fk_inv_item_sk FOREIGN KEY(inv_item_sk) REFERENCES tcpds_2_1_0.item(i_item_sk),
CONSTRAINT fk_inv_warehouse_sk FOREIGN KEY(inv_warehouse_sk) REFERENCES tcpds_2_1_0.warehouse(w_warehouse_sk)
)