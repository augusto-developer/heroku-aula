create table tb_category (id bigserial not null, name varchar(255), primary key (id));
create table tb_order (status smallint check (status between 0 and 4), client_id bigint, id bigserial not null, moment TIMESTAMP WITHOUT TIME ZONE, primary key (id));
create table tb_order_item (price float(53), quantity integer, order_id bigint not null, product_id bigint not null, primary key (order_id, product_id));
create table tb_payment (moment TIMESTAMP WITHOUT TIME ZONE, order_id bigint not null, primary key (order_id));
create table tb_product (price float(53), id bigserial not null, description TEXT, img_url varchar(255), name varchar(255), primary key (id));
create table tb_product_category (category_id bigint not null, product_id bigint not null, primary key (category_id, product_id));
create table tb_role (id bigserial not null, authority varchar(255), primary key (id));
create table tb_user (birth_date date, id bigserial not null, email varchar(255) unique, name varchar(255), password varchar(255), phone varchar(255), primary key (id));
create table tb_user_role (role_id bigint not null, user_id bigint not null, primary key (role_id, user_id));
alter table if exists tb_order add constraint FKi0x0rv7d65vsceuy33km9567n foreign key (client_id) references tb_user;
alter table if exists tb_order_item add constraint FK4h5xid5qehset7qwe5l9c997x foreign key (product_id) references tb_product;
alter table if exists tb_order_item add constraint FKgeobgl2xu916he8vhljktwxnx foreign key (order_id) references tb_order;
alter table if exists tb_payment add constraint FKokaf4il2cwit4h780c25dv04r foreign key (order_id) references tb_order;
alter table if exists tb_product_category add constraint FK5r4sbavb4nkd9xpl0f095qs2a foreign key (category_id) references tb_category;
alter table if exists tb_product_category add constraint FKgbof0jclmaf8wn2alsoexxq3u foreign key (product_id) references tb_product;
alter table if exists tb_user_role add constraint FKea2ootw6b6bb0xt3ptl28bymv foreign key (role_id) references tb_role;
alter table if exists tb_user_role add constraint FK7vn3h53d0tqdimm8cp45gc0kl foreign key (user_id) references tb_user;
INSERT INTO tb_category(name) VALUES ('Software');
INSERT INTO tb_product (name, price, description, img_url) VALUES ('FastTrade', 10.0, 'Application to make builds more faster', 'https://raw.githubusercontent.com/devsuperior/dscatalog-resources/master/backend/img/1-big.jpg');
INSERT INTO tb_product_category (product_id, category_id) VALUES (1, 1);
INSERT INTO tb_user (name, email, phone, password, birth_date) VALUES ('Maria Brown', 'maria@gmail.com', '988888888', '$2a$10$N7SkKCa3r17ga.i.dF9iy.BFUBL2n3b6Z1CWSZWi/qy7ABq/E6VpO', '2001-07-25');
INSERT INTO tb_user (name, email, phone, password, birth_date) VALUES ('Alex Green', 'alex@gmail.com', '977777777', '$2a$10$N7SkKCa3r17ga.i.dF9iy.BFUBL2n3b6Z1CWSZWi/qy7ABq/E6VpO', '1987-12-13');
INSERT INTO tb_role (authority) VALUES ('ROLE_CLIENT');
INSERT INTO tb_role (authority) VALUES ('ROLE_ADMIN');
INSERT INTO tb_user_role (user_id, role_id) VALUES (1, 1);
INSERT INTO tb_user_role (user_id, role_id) VALUES (2, 1);
INSERT INTO tb_user_role (user_id, role_id) VALUES (2, 2);
INSERT INTO tb_order (moment, status, client_id) VALUES (TIMESTAMP WITH TIME ZONE '2022-07-25T13:00:00Z', 1, 1);
INSERT INTO tb_order_item (order_id, product_id, quantity, price) VALUES (1, 1, 2, 90.5);
INSERT INTO tb_payment (order_id, moment) VALUES (1, TIMESTAMP WITH TIME ZONE '2022-07-25T15:00:00Z');
