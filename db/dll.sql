DROP TABLE IF EXISTS users_cards;
DROP TABLE IF EXISTS users_addresses;
DROP TABLE IF EXISTS user_ratings;
DROP TABLE IF EXISTS sub_category;
DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS reviews;
DROP TABLE IF EXISTS sales;
DROP TABLE IF EXISTS carts;
DROP TABLE IF EXISTS item_images;
DROP TABLE IF EXISTS items_categories;
DROP TABLE IF EXISTS items;
DROP TABLE IF EXISTS administrators;
DROP TABLE IF EXISTS cards;
DROP TABLE IF EXISTS payment_types;
DROP TABLE IF EXISTS addresses;
DROP TABLE IF EXISTS residence_types;
DROP TABLE IF EXISTS streets;
DROP TABLE IF EXISTS street_types;
DROP TABLE IF EXISTS cities;
DROP TABLE IF EXISTS states;
DROP TABLE IF EXISTS countries;
DROP TABLE IF EXISTS categories;
DROP TABLE IF EXISTS publishers;


CREATE TABLE administrators
(
    adm_id       INT          NOT NULL AUTO_INCREMENT,
    adm_email    VARCHAR(255) NOT NULL,
    adm_password VARCHAR(255) NOT NULL,
    PRIMARY KEY (adm_id)
) ENGINE = InnoDB;

CREATE TABLE categories
(
    cat_id       INT         NOT NULL AUTO_INCREMENT,
    cat_category VARCHAR(50) NOT NULL,
    PRIMARY KEY (cat_id)
) ENGINE = InnoDB;

CREATE TABLE countries
(
    cou_id      INT         NOT NULL AUTO_INCREMENT,
    cou_country VARCHAR(80) NOT NULL,
    PRIMARY KEY (cou_id)
) ENGINE = InnoDB;

CREATE TABLE publishers
(
    pub_id        INT         NOT NULL AUTO_INCREMENT,
    pub_publisher VARCHAR(80) NOT NULL,
    PRIMARY KEY (pub_id)
) ENGINE = InnoDB;

CREATE TABLE states
(
    sta_id     INT         NOT NULL AUTO_INCREMENT,
    sta_state  VARCHAR(80) NOT NULL,
    sta_uf     VARCHAR(3)  NOT NULL,
    sta_cou_id INT         NOT NULL,
    PRIMARY KEY (sta_id),
    FOREIGN KEY (sta_cou_id) REFERENCES countries (cou_id)
) ENGINE = InnoDB;

CREATE TABLE cities
(
    cit_id     INT          NOT NULL AUTO_INCREMENT,
    cit_city   VARCHAR(100) NOT NULL,
    cit_sta_id INT          NOT NULL,
    PRIMARY KEY (cit_id),
    FOREIGN KEY (cit_sta_id) REFERENCES states (sta_id)
) ENGINE = InnoDB;

CREATE TABLE street_types
(
    sty_id        INT         NOT NULL AUTO_INCREMENT,
    sty_street_type VARCHAR(50) NOT NULL,
    PRIMARY KEY (sty_id)
) ENGINE = InnoDB;

CREATE TABLE streets
(
    str_id         INT          NOT NULL AUTO_INCREMENT,
    str_street     VARCHAR(100) NOT NULL,
    str_neighborhood VARCHAR(100) NOT NULL,
    str_zip        VARCHAR(11)  NOT NULL,
    str_sty_id     INT          NOT NULL,
    str_cit_id     INT          NOT NULL,
    PRIMARY KEY (str_id),
    FOREIGN KEY (str_sty_id) REFERENCES street_types (sty_id),
    FOREIGN KEY (str_cit_id) REFERENCES cities (cit_id)
) ENGINE = InnoDB;

CREATE TABLE residence_types
(
    rty_id           INT         NOT NULL AUTO_INCREMENT,
    rty_residence_type VARCHAR(50) NOT NULL,
    PRIMARY KEY (rty_id)
) ENGINE = InnoDB;

CREATE TABLE addresses
(
    add_id         INT          NOT NULL AUTO_INCREMENT,
    add_number     VARCHAR(10)  NOT NULL,
    add_complement VARCHAR(255),
    add_rty_id     INT          NOT NULL,
    add_str_id     INT          NOT NULL,
    PRIMARY KEY (add_id),
    FOREIGN KEY (add_rty_id) REFERENCES residence_types (rty_id),
    FOREIGN KEY (add_str_id) REFERENCES streets (str_id)
) ENGINE = InnoDB;

CREATE TABLE payment_types
(
    pty_id           INT         NOT NULL AUTO_INCREMENT,
    pty_payment_type VARCHAR(50) NOT NULL,
    PRIMARY KEY (pty_id)
) ENGINE = InnoDB;

CREATE TABLE cards
(
    car_id     INT          NOT NULL AUTO_INCREMENT,
    car_number VARCHAR(17)  NOT NULL,
    car_ccv    VARCHAR(4)   NOT NULL,
    car_holder VARCHAR(255) NOT NULL,
    car_valid  VARCHAR(6)   NOT NULL,
    car_pty_id INT          NOT NULL,
    PRIMARY KEY (car_id),
    FOREIGN KEY (car_pty_id) REFERENCES payment_types (pty_id)
) ENGINE = InnoDB;

CREATE TABLE items
(
    itm_id           INT            NOT NULL AUTO_INCREMENT,
    itm_item         VARCHAR(100)   NOT NULL,
    itm_price        DECIMAL(12, 3) NOT NULL,
    itm_stock        INT            NOT NULL,
    itm_characteristics VARCHAR(255),
    itm_year         INT(6),
    itm_pub_id       INT            NOT NULL,
    itm_cou_id       INT            NOT NULL,
    PRIMARY KEY (itm_id),
    FOREIGN KEY (itm_pub_id) REFERENCES publishers (pub_id),
    FOREIGN KEY (itm_cou_id) REFERENCES countries (cou_id)
) ENGINE = InnoDB;

CREATE TABLE item_images
(
    img_id     INT      NOT NULL AUTO_INCREMENT,
    img_image  LONGBLOB NOT NULL,
    img_order  INT(3)   NOT NULL,
    img_itm_id INT      NOT NULL,
    PRIMARY KEY (img_id),
    FOREIGN KEY (img_itm_id) REFERENCES items (itm_id)
) ENGINE = InnoDB;

CREATE TABLE items_categories
(
    ica_cat_id INT NOT NULL,
    ica_itm_id INT NOT NULL,
    PRIMARY KEY (ica_cat_id, ica_itm_id),
    FOREIGN KEY (ica_cat_id) REFERENCES categories (cat_id),
    FOREIGN KEY (ica_itm_id) REFERENCES items (itm_id)
) ENGINE = InnoDB;

CREATE TABLE users
(
    usr_id        INT          NOT NULL AUTO_INCREMENT,
    usr_email     VARCHAR(255) NOT NULL,
    usr_password  VARCHAR(255) NOT NULL,
    usr_name      VARCHAR(255) NOT NULL,
    usr_cellphone VARCHAR(18)  NOT NULL,
    usr_birth_date DATE         NOT NULL,
    usr_cpf       VARCHAR(15)  NOT NULL,
    usr_rg        VARCHAR(12),
    PRIMARY KEY (usr_id)
) ENGINE = InnoDB;

CREATE TABLE carts
(
    items_itm_id INT NOT NULL,
    users_usr_id INT NOT NULL,
    PRIMARY KEY (items_itm_id, users_usr_id),
    FOREIGN KEY (items_itm_id) REFERENCES items (itm_id),
    FOREIGN KEY (users_usr_id) REFERENCES users (usr_id)
) ENGINE = InnoDB;


CREATE TABLE sales
(
    sal_id          INT            NOT NULL AUTO_INCREMENT,
    sal_value       DECIMAL(10, 3) NOT NULL,
    sal_date        DATE           NOT NULL,
    sal_delivery_date DATE           NOT NULL,
    sal_finished    CHAR(1)        NOT NULL,
    sal_usr_id      INT            NOT NULL,
    sal_pty_id      INT            NOT NULL,
    sal_add_id      INT            NOT NULL,
    PRIMARY KEY (sal_id),
    FOREIGN KEY (sal_usr_id) REFERENCES users (usr_id),
    FOREIGN KEY (sal_pty_id) REFERENCES payment_types (pty_id),
    FOREIGN KEY (sal_add_id) REFERENCES addresses (add_id)
) ENGINE = InnoDB;

CREATE TABLE orders
(
    ord_quantity   INT            NOT NULL,
    ord_unit_price DECIMAL(12, 3) NOT NULL,
    ord_itm_id     INT            NOT NULL,
    ord_sal_id     INT            NOT NULL,
    PRIMARY KEY (ord_itm_id, ord_sal_id),
    FOREIGN KEY (ord_itm_id) REFERENCES items (itm_id),
    FOREIGN KEY (ord_sal_id) REFERENCES sales (sal_id)
) ENGINE = InnoDB;

CREATE TABLE reviews
(
    rev_comment VARCHAR(255),
    rev_rating  DECIMAL(4, 2) NOT NULL,
    rev_usr_id  INT           NOT NULL,
    rev_itm_id  INT           NOT NULL,
    PRIMARY KEY (rev_itm_id, rev_usr_id),
    FOREIGN KEY (rev_usr_id) REFERENCES users (usr_id),
    FOREIGN KEY (rev_itm_id) REFERENCES items (itm_id)
) ENGINE = InnoDB;

CREATE TABLE sub_category
(
    sca_id         VARCHAR(10) NOT NULL,
    sca_sub_category VARCHAR(50) NOT NULL,
    sca_cat_id     INT         NOT NULL,
    PRIMARY KEY (sca_id),
    FOREIGN KEY (sca_cat_id) REFERENCES categories (cat_id)
) ENGINE = InnoDB;

CREATE TABLE user_ratings
(
    ura_reviewed_id INT           NOT NULL,
    ura_reviewer_id INT           NOT NULL,
    ura_rating      DECIMAL(4, 2) NOT NULL,
    PRIMARY KEY (ura_reviewer_id, ura_reviewed_id),
    FOREIGN KEY (ura_reviewed_id) REFERENCES users (usr_id),
    FOREIGN KEY (ura_reviewer_id) REFERENCES users (usr_id)
) ENGINE = InnoDB;

CREATE TABLE users_addresses
(
    uad_usr_id INT NOT NULL,
    uad_add_id INT NOT NULL,
    PRIMARY KEY (uad_usr_id, uad_add_id),
    FOREIGN KEY (uad_usr_id) REFERENCES users (usr_id),
    FOREIGN KEY (uad_add_id) REFERENCES addresses (add_id)
) ENGINE = InnoDB;

CREATE TABLE users_cards
(
    uca_usr_id INT NOT NULL,
    uca_car_id INT NOT NULL,
    PRIMARY KEY (uca_usr_id, uca_car_id),
    FOREIGN KEY (uca_usr_id) REFERENCES users (usr_id),
    FOREIGN KEY (uca_car_id) REFERENCES cards (car_id)
) ENGINE = InnoDB;