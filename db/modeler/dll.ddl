-- Gerado por Oracle SQL Developer Data Modeler 24.3.1.351.0831
--   em:        2025-07-17 13:29:32 BRT
--   site:      Oracle Database 21c
--   tipo:      Oracle Database 21c



-- predefined type, no DDL - MDSYS.SDO_GEOMETRY

-- predefined type, no DDL - XMLTYPE

CREATE TABLE addresses 
    ( 
     add_id         NUMBER (10)  NOT NULL , 
     add_number     VARCHAR2 (10)  NOT NULL , 
     add_complement VARCHAR2 (255) , 
     add_rty_id     NUMBER (10)  NOT NULL , 
     add_str_id     NUMBER (10)  NOT NULL 
    ) 
    LOGGING 
;

ALTER TABLE addresses 
    ADD CONSTRAINT address_pk PRIMARY KEY ( add_id ) ;

CREATE TABLE administrators 
    ( 
     adm_id       NUMBER (10)  NOT NULL , 
     adm_email    VARCHAR2 (255)  NOT NULL , 
     adm_password VARCHAR2 (255)  NOT NULL 
    ) 
    LOGGING 
;

ALTER TABLE administrators 
    ADD CONSTRAINT administrators_PK PRIMARY KEY ( adm_id ) ;

CREATE TABLE cards 
    ( 
     car_id     NUMBER (10)  NOT NULL , 
     car_number VARCHAR2 (17)  NOT NULL , 
     car_ccv    VARCHAR2 (4)  NOT NULL , 
     car_holder VARCHAR2 (255)  NOT NULL , 
     car_valid  VARCHAR2 (6)  NOT NULL , 
     car_pty_id NUMBER (10)  NOT NULL 
    ) 
    LOGGING 
;

ALTER TABLE cards 
    ADD CONSTRAINT cards_pk PRIMARY KEY ( car_id ) ;

CREATE TABLE carts 
    ( 
     items_itm_id NUMBER (10)  NOT NULL , 
     users_usr_id NUMBER (10)  NOT NULL 
    ) 
    LOGGING 
;

CREATE TABLE categories 
    ( 
     cat_id       NUMBER (10)  NOT NULL , 
     cat_category VARCHAR2 (50)  NOT NULL 
    ) 
    LOGGING 
;

ALTER TABLE categories 
    ADD CONSTRAINT categories_PK PRIMARY KEY ( cat_id ) ;

CREATE TABLE cities 
    ( 
     cit_id     NUMBER (10)  NOT NULL , 
     cit_city   VARCHAR2 (100)  NOT NULL , 
     cit_sta_id NUMBER (10)  NOT NULL 
    ) 
    LOGGING 
;

ALTER TABLE cities 
    ADD CONSTRAINT cities_pk PRIMARY KEY ( cit_id ) ;

CREATE TABLE countries 
    ( 
     cou_id      NUMBER (10)  NOT NULL , 
     cou_country VARCHAR2 (80)  NOT NULL 
    ) 
    LOGGING 
;

ALTER TABLE countries 
    ADD CONSTRAINT countries_PK PRIMARY KEY ( cou_id ) ;

CREATE TABLE item_images 
    ( 
     img_id     NUMBER (10)  NOT NULL , 
     img_image  UNKNOWN 
--  ERROR: Datatype UNKNOWN is not allowed 
                     NOT NULL , 
     img_order  NUMBER (3)  NOT NULL , 
     img_itm_id NUMBER (10)  NOT NULL 
    ) 
    LOGGING 
;

ALTER TABLE item_images 
    ADD CONSTRAINT item_images_PK PRIMARY KEY ( img_id ) ;

CREATE TABLE items 
    ( 
     itm_id              NUMBER (10)  NOT NULL , 
     itm_item            VARCHAR2 (100)  NOT NULL , 
     itm_price           NUMBER (12,3)  NOT NULL , 
     itm_stock           NUMBER (5)  NOT NULL , 
     itm_characteristics VARCHAR2 (255) , 
     itm_year            NUMBER (6) , 
     itm_pub_id          NUMBER (10)  NOT NULL , 
     itm_cou_id          NUMBER (10)  NOT NULL 
    ) 
    LOGGING 
;

ALTER TABLE items 
    ADD CONSTRAINT items_PK PRIMARY KEY ( itm_id ) ;

CREATE TABLE items_categories 
    ( 
     ica_cat_id NUMBER (10)  NOT NULL , 
     ica_itm_id NUMBER (10)  NOT NULL 
    ) 
    LOGGING 
;

ALTER TABLE items_categories 
    ADD CONSTRAINT items_categories_PK PRIMARY KEY ( ica_cat_id, ica_itm_id ) ;

CREATE TABLE orders 
    ( 
     ord_quantity   NUMBER (5)  NOT NULL , 
     ord_unit_price NUMBER (12,3)  NOT NULL , 
     ord_itm_id     NUMBER (10)  NOT NULL , 
     ord_sal_id     NUMBER (10)  NOT NULL 
    ) 
    LOGGING 
;

ALTER TABLE orders 
    ADD CONSTRAINT orders_PK PRIMARY KEY ( ord_itm_id, ord_sal_id ) ;

CREATE TABLE payment_types 
    ( 
     pty_id           NUMBER (10)  NOT NULL , 
     pty_payment_type VARCHAR2 (50)  NOT NULL 
    ) 
    LOGGING 
;

ALTER TABLE payment_types 
    ADD CONSTRAINT payment_types_PK PRIMARY KEY ( pty_id ) ;

CREATE TABLE publishers 
    ( 
     pub_id        NUMBER (10)  NOT NULL , 
     pub_publisher VARCHAR2 (80)  NOT NULL 
    ) 
    LOGGING 
;

ALTER TABLE publishers 
    ADD CONSTRAINT publishers_PK PRIMARY KEY ( pub_id ) ;

CREATE TABLE residence_types 
    ( 
     rty_id             NUMBER (10)  NOT NULL , 
     rty_residence_type VARCHAR2 (50)  NOT NULL 
    ) 
    LOGGING 
;

ALTER TABLE residence_types 
    ADD CONSTRAINT residence_types_PK PRIMARY KEY ( rty_id ) ;

CREATE TABLE reviews 
    ( 
     rev_comment VARCHAR2 (255) , 
     rev_rating  NUMBER (4,2)  NOT NULL , 
     rev_usr_id  NUMBER (10)  NOT NULL , 
     rev_itm_id  NUMBER (10)  NOT NULL 
    ) 
    LOGGING 
;

ALTER TABLE reviews 
    ADD CONSTRAINT reviews_PK PRIMARY KEY ( rev_itm_id, rev_usr_id ) ;

CREATE TABLE sales 
    ( 
     sal_id            NUMBER (10)  NOT NULL , 
     sal_value         NUMBER (10,3)  NOT NULL , 
     sal_date          DATE  NOT NULL , 
     sal_delivery_date DATE  NOT NULL , 
     sal_finished      CHAR (1)  NOT NULL , 
     sal_usr_id        NUMBER (10)  NOT NULL , 
     sal_pty_id        NUMBER (10)  NOT NULL , 
     sal_add_id        NUMBER (10)  NOT NULL 
    ) 
    LOGGING 
;

ALTER TABLE sales 
    ADD CONSTRAINT sales_pk PRIMARY KEY ( sal_id ) ;

CREATE TABLE states 
    ( 
     sta_id     NUMBER (10)  NOT NULL , 
     sta_state  VARCHAR2 (80)  NOT NULL , 
     sta_uf     VARCHAR2 (3)  NOT NULL , 
     sta_cou_id NUMBER (10)  NOT NULL 
    ) 
    LOGGING 
;

ALTER TABLE states 
    ADD CONSTRAINT states_pk PRIMARY KEY ( sta_id ) ;

CREATE TABLE street_types 
    ( 
     sty_id          NUMBER (10)  NOT NULL , 
     sty_street_type VARCHAR2 (50)  NOT NULL 
    ) 
    LOGGING 
;

ALTER TABLE street_types 
    ADD CONSTRAINT street_types_PK PRIMARY KEY ( sty_id ) ;

CREATE TABLE streets 
    ( 
     str_id           NUMBER (10)  NOT NULL , 
     str_street       VARCHAR2 (100)  NOT NULL , 
     str_neighborhood VARCHAR2 (100)  NOT NULL , 
     str_zip          VARCHAR2 (11)  NOT NULL , 
     str_sty_id       NUMBER (10)  NOT NULL , 
     str_cit_id       NUMBER (10)  NOT NULL 
    ) 
    LOGGING 
;

ALTER TABLE streets 
    ADD CONSTRAINT streets_PK PRIMARY KEY ( str_id ) ;

CREATE TABLE sub_category 
    ( 
     sca_id           VARCHAR2 (10)  NOT NULL , 
     sca_sub_category VARCHAR2 (50)  NOT NULL , 
     sca_cat_id       NUMBER (10)  NOT NULL 
    ) 
    LOGGING 
;

ALTER TABLE sub_category 
    ADD CONSTRAINT sub_category_PK PRIMARY KEY ( sca_id ) ;

CREATE TABLE user_ratings 
    ( 
     ura_reviewed_id NUMBER (10)  NOT NULL , 
     ura_reviewer_id NUMBER (10)  NOT NULL , 
     ura_rating      NUMBER (4,2)  NOT NULL 
    ) 
    LOGGING 
;

ALTER TABLE user_ratings 
    ADD CONSTRAINT user_ratings_PK PRIMARY KEY ( ura_reviewer_id, ura_reviewed_id ) ;

CREATE TABLE users 
    ( 
     usr_id         NUMBER (10)  NOT NULL , 
     usr_email      VARCHAR2 (255)  NOT NULL , 
     usr_password   VARCHAR2 (255)  NOT NULL , 
     usr_name       VARCHAR2 (255)  NOT NULL , 
     usr_cellphone  VARCHAR2 (18)  NOT NULL , 
     usr_birth_date DATE  NOT NULL , 
     usr_cpf        VARCHAR2 (15)  NOT NULL , 
     usr_rg         VARCHAR2 (12) 
    ) 
    LOGGING 
;

ALTER TABLE users 
    ADD CONSTRAINT users_pk PRIMARY KEY ( usr_id ) ;

CREATE TABLE users_addresses 
    ( 
     uad_usr_id NUMBER (10)  NOT NULL , 
     uad_add_id NUMBER (10)  NOT NULL 
    ) 
    LOGGING 
;

ALTER TABLE users_addresses 
    ADD CONSTRAINT users_addresses_PK PRIMARY KEY ( uad_usr_id, uad_add_id ) ;

CREATE TABLE users_cards 
    ( 
     uca_usr_id NUMBER (10)  NOT NULL , 
     uca_car_id NUMBER (10)  NOT NULL 
    ) 
    LOGGING 
;

ALTER TABLE users_cards 
    ADD CONSTRAINT users_cards_PK PRIMARY KEY ( uca_usr_id, uca_car_id ) ;

ALTER TABLE addresses 
    ADD CONSTRAINT add_rty_FK FOREIGN KEY 
    ( 
     add_rty_id
    ) 
    REFERENCES residence_types 
    ( 
     rty_id
    ) 
    NOT DEFERRABLE 
;

ALTER TABLE addresses 
    ADD CONSTRAINT add_str_FK FOREIGN KEY 
    ( 
     add_str_id
    ) 
    REFERENCES streets 
    ( 
     str_id
    ) 
    NOT DEFERRABLE 
;

ALTER TABLE cards 
    ADD CONSTRAINT car_pty_FK FOREIGN KEY 
    ( 
     car_pty_id
    ) 
    REFERENCES payment_types 
    ( 
     pty_id
    ) 
    NOT DEFERRABLE 
;

ALTER TABLE cities 
    ADD CONSTRAINT cit_sta_FK FOREIGN KEY 
    ( 
     cit_sta_id
    ) 
    REFERENCES states 
    ( 
     sta_id
    ) 
    NOT DEFERRABLE 
;

ALTER TABLE carts 
    ADD CONSTRAINT crt_itm_FK FOREIGN KEY 
    ( 
     items_itm_id
    ) 
    REFERENCES items 
    ( 
     itm_id
    ) 
    NOT DEFERRABLE 
;

ALTER TABLE carts 
    ADD CONSTRAINT crt_usr_FK FOREIGN KEY 
    ( 
     users_usr_id
    ) 
    REFERENCES users 
    ( 
     usr_id
    ) 
    NOT DEFERRABLE 
;

ALTER TABLE items_categories 
    ADD CONSTRAINT ica_cat_FK FOREIGN KEY 
    ( 
     ica_cat_id
    ) 
    REFERENCES categories 
    ( 
     cat_id
    ) 
    NOT DEFERRABLE 
;

ALTER TABLE items_categories 
    ADD CONSTRAINT ica_itm_FK FOREIGN KEY 
    ( 
     ica_itm_id
    ) 
    REFERENCES items 
    ( 
     itm_id
    ) 
    NOT DEFERRABLE 
;

ALTER TABLE item_images 
    ADD CONSTRAINT img_itm_FK FOREIGN KEY 
    ( 
     img_itm_id
    ) 
    REFERENCES items 
    ( 
     itm_id
    ) 
    NOT DEFERRABLE 
;

ALTER TABLE items 
    ADD CONSTRAINT itm_cou_FK FOREIGN KEY 
    ( 
     itm_cou_id
    ) 
    REFERENCES countries 
    ( 
     cou_id
    ) 
    NOT DEFERRABLE 
;

ALTER TABLE items 
    ADD CONSTRAINT itm_pub_FK FOREIGN KEY 
    ( 
     itm_pub_id
    ) 
    REFERENCES publishers 
    ( 
     pub_id
    ) 
    NOT DEFERRABLE 
;

ALTER TABLE orders 
    ADD CONSTRAINT ord_itm_FK FOREIGN KEY 
    ( 
     ord_itm_id
    ) 
    REFERENCES items 
    ( 
     itm_id
    ) 
    NOT DEFERRABLE 
;

ALTER TABLE orders 
    ADD CONSTRAINT ord_sal_FK FOREIGN KEY 
    ( 
     ord_sal_id
    ) 
    REFERENCES sales 
    ( 
     sal_id
    ) 
    NOT DEFERRABLE 
;

ALTER TABLE reviews 
    ADD CONSTRAINT rev_itm_FK FOREIGN KEY 
    ( 
     rev_itm_id
    ) 
    REFERENCES items 
    ( 
     itm_id
    ) 
    NOT DEFERRABLE 
;

ALTER TABLE reviews 
    ADD CONSTRAINT rev_usr_FK FOREIGN KEY 
    ( 
     rev_usr_id
    ) 
    REFERENCES users 
    ( 
     usr_id
    ) 
    NOT DEFERRABLE 
;

ALTER TABLE sales 
    ADD CONSTRAINT sal_add_FK FOREIGN KEY 
    ( 
     sal_add_id
    ) 
    REFERENCES addresses 
    ( 
     add_id
    ) 
    NOT DEFERRABLE 
;

ALTER TABLE sales 
    ADD CONSTRAINT sal_pty_FK FOREIGN KEY 
    ( 
     sal_pty_id
    ) 
    REFERENCES payment_types 
    ( 
     pty_id
    ) 
    NOT DEFERRABLE 
;

ALTER TABLE sales 
    ADD CONSTRAINT sal_usr_FK FOREIGN KEY 
    ( 
     sal_usr_id
    ) 
    REFERENCES users 
    ( 
     usr_id
    ) 
    NOT DEFERRABLE 
;

ALTER TABLE sub_category 
    ADD CONSTRAINT sca_cat_FK FOREIGN KEY 
    ( 
     sca_cat_id
    ) 
    REFERENCES categories 
    ( 
     cat_id
    ) 
    NOT DEFERRABLE 
;

ALTER TABLE states 
    ADD CONSTRAINT sta_cou_FK FOREIGN KEY 
    ( 
     sta_cou_id
    ) 
    REFERENCES countries 
    ( 
     cou_id
    ) 
    NOT DEFERRABLE 
;

ALTER TABLE streets 
    ADD CONSTRAINT str_cit_FK FOREIGN KEY 
    ( 
     str_cit_id
    ) 
    REFERENCES cities 
    ( 
     cit_id
    ) 
    NOT DEFERRABLE 
;

ALTER TABLE streets 
    ADD CONSTRAINT str_sty_FK FOREIGN KEY 
    ( 
     str_sty_id
    ) 
    REFERENCES street_types 
    ( 
     sty_id
    ) 
    NOT DEFERRABLE 
;

ALTER TABLE users_addresses 
    ADD CONSTRAINT uad_add_FK FOREIGN KEY 
    ( 
     uad_add_id
    ) 
    REFERENCES addresses 
    ( 
     add_id
    ) 
    NOT DEFERRABLE 
;

ALTER TABLE users_addresses 
    ADD CONSTRAINT uad_usr_FK FOREIGN KEY 
    ( 
     uad_usr_id
    ) 
    REFERENCES users 
    ( 
     usr_id
    ) 
    NOT DEFERRABLE 
;

ALTER TABLE users_cards 
    ADD CONSTRAINT uca_car_FK FOREIGN KEY 
    ( 
     uca_car_id
    ) 
    REFERENCES cards 
    ( 
     car_id
    ) 
    NOT DEFERRABLE 
;

ALTER TABLE users_cards 
    ADD CONSTRAINT uca_usr_FK FOREIGN KEY 
    ( 
     uca_usr_id
    ) 
    REFERENCES users 
    ( 
     usr_id
    ) 
    NOT DEFERRABLE 
;

ALTER TABLE user_ratings 
    ADD CONSTRAINT ura_usr_FK FOREIGN KEY 
    ( 
     ura_reviewed_id
    ) 
    REFERENCES users 
    ( 
     usr_id
    ) 
    NOT DEFERRABLE 
;

ALTER TABLE user_ratings 
    ADD CONSTRAINT ura_usr_FKv1 FOREIGN KEY 
    ( 
     ura_reviewer_id
    ) 
    REFERENCES users 
    ( 
     usr_id
    ) 
    NOT DEFERRABLE 
;



-- Relatório do Resumo do Oracle SQL Developer Data Modeler: 
-- 
-- CREATE TABLE                            24
-- CREATE INDEX                             0
-- ALTER TABLE                             51
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           0
-- ALTER TRIGGER                            0
-- CREATE COLLECTION TYPE                   0
-- CREATE STRUCTURED TYPE                   0
-- CREATE STRUCTURED TYPE BODY              0
-- CREATE CLUSTER                           0
-- CREATE CONTEXT                           0
-- CREATE DATABASE                          0
-- CREATE DIMENSION                         0
-- CREATE DIRECTORY                         0
-- CREATE DISK GROUP                        0
-- CREATE ROLE                              0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE SEQUENCE                          0
-- CREATE MATERIALIZED VIEW                 0
-- CREATE MATERIALIZED VIEW LOG             0
-- CREATE SYNONYM                           0
-- CREATE TABLESPACE                        0
-- CREATE USER                              0
-- 
-- DROP TABLESPACE                          0
-- DROP DATABASE                            0
-- 
-- REDACTION POLICY                         0
-- 
-- ORDS DROP SCHEMA                         0
-- ORDS ENABLE SCHEMA                       0
-- ORDS ENABLE OBJECT                       0
-- 
-- ERRORS                                   1
-- WARNINGS                                 0
