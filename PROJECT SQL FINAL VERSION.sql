create database Test_Last
use Test_Last
/*Table: CATEGORIES            
*/
/*==============================================================*/
CREATE TABLE            CATEGORIES  (
   CATEGORY_CODE       DECIMAL(6)                       NOT NULL,
   CATEGORY_NAME        VARCHAR(25)                    NOT NULL,
   DESCRIPTION          VARCHAR(100)                   NOT NULL,
   CONSTRAINT PK_CATEGORIES PRIMARY KEY (CATEGORY_CODE)
   );
/*==============================================================*/
/* Table: CUSTOMERS                                               */
/*==============================================================*/
CREATE TABLE            CUSTOMERS   (
   CUSTOMER_CODE          CHAR(5)                         NOT NULL,
   COMPANY              NVARCHAR(40)                   NOT NULL,
   ADDRESS             NVARCHAR(60)                   NOT NULL,
   CITY               VARCHAR(30)                    NOT NULL,
   POSTAL_CODE         VARCHAR(10)                    NOT NULL,
   COUNTRY             VARCHAR(15)                    NOT NULL,
   PHONE               VARCHAR(24)                    NOT NULL,
   FAX                 VARCHAR(24),
   CONSTRAINT PK_CUSTOMERSPRIMARY primary KEY (CUSTOMER_CODE)
  );

/*==============================================================*/
/* Table: ORDERS                                          */
/*==============================================================*/
CREATE TABLE            ORDERS  (
   ORDER_NUMBER           DECIMAL(6)                       NOT NULL,
   CUSTOMER_CODE          CHAR(5)                         NOT NULL,
   EMPLOYEE_NUMBER          DECIMAL(6)                       NOT NULL,
   ORDER_DATE	         DATE                            NOT NULL,
   SHIP_DATE          		DATE,
   SHIPPING_COST                DECIMAL(8,5),
   CONSTRAINT PK_ORDERS  PRIMARY KEY (ORDER_NUMBER)
    );
/*==============================================================*/
/* Table: ORDER_DETAILS                                   */
/*==============================================================*/
CREATE TABLE            ORDER_DETAILS  (
   ORDER_NUMBER         DECIMAL(6)                       NOT NULL,
   PRODUCT_REF         DECIMAL(6)                       NOT NULL,
   UNIT_PRICE       DECIMAL(8,5)                     NOT NULL,
   QUANTITY            DECIMAL(5)                       NOT NULL,
   DISCOUNT              FLOAT                           NOT NULL,
   CONSTRAINT PK_DETAILS_ORDERS  PRIMARY KEY (ORDER_NUMBER , PRODUCT_REF )
  );

/*==============================================================*/
/* Table: EMPLOYEES                                             */
/*==============================================================*/
CREATE TABLE            EMPLOYEES (
   EMPLOYEE_NUMBER          DECIMAL(6)                       NOT NULL,
   REPORTS_TO         DECIMAL(6),
   LAST_NAME                 VARCHAR(40)                   NOT NULL,
   FIRST_NAME              VARCHAR(30)                   NOT NULL,
   POSITION            VARCHAR(30)                    NOT NULL,
   TITLE               VARCHAR(5)                     NOT NULL,
   BIRTH_DATE      DATE                            NOT NULL,
   HIRE_DATE       DATE            DEFAULT getdate() NOT NULL,
   SALARY             DECIMAL(8,5)                     NOT NULL,
   COMMISSION          DECIMAL(8,5),
   CONSTRAINT PK_EMPLOYEES PRIMARY KEY (EMPLOYEE_NUMBER)
  );
/*==============================================================*/
/* Table: SUPPLIERS                                          */
/*==============================================================*/
CREATE TABLE            SUPPLIERS  (
   SUPPLIER_NUMBER      DECIMAL(6)                       NOT NULL,
   COMPANY             VARCHAR(40)                   NOT NULL,
   ADDRESS             VARCHAR(60)                   NOT NULL,
   CITY               VARCHAR(30)                    NOT NULL,
   POSTAL_CODE         VARCHAR(10)                    NOT NULL,
   COUNTRY                VARCHAR(15)                    NOT NULL,
   PHONE          	 VARCHAR(24)                    NOT NULL,
   FAX                 VARCHAR(24),
   CONSTRAINT PK_SUPPLIERS PRIMARY KEY (SUPPLIER_NUMBER)
  );

/*==============================================================*/
/* Table: PRODUCTS                                             */
/*==============================================================*/
CREATE TABLE            PRODUCTS (
   PRODUCT_REF         DECIMAL(6)                       NOT NULL,
   PRODUCT_NAME         VARCHAR(40)                   NOT NULL,
   SUPPLIER_NUMBER      DECIMAL(6)                       NOT NULL,
   CATEGORY_CODE     	 DECIMAL(6)                       NOT NULL,
   QUANTITY            VARCHAR(30),
   UNIT_PRICE       	DECIMAL(8,5)                     NOT NULL,
   UNITS_IN_STOCK        DECIMAL(5),
   UNITS_ON_ORDER   	DECIMAL(5),
   UNAVAILABLE	        DECIMAL(1),
   CONSTRAINT PK_PRODUCTS  PRIMARY KEY (PRODUCT_REF)
  );
/*==============================================================*/
ALTER TABLE EMPLOYEES
ALTER COLUMN SALARY DECIMAL(4, 2);  -- Allows larger salary values
ALTER TABLE EMPLOYEES
ALTER COLUMN COMMISSION DECIMAL(2,2);  -- Allows larger commission values

INSERT INTO EMPLOYEES (EMPLOYEE_NUMBER, REPORTS_TO, LAST_NAME, FIRST_NAME, POSITION, TITLE, BIRTH_DATE, HIRE_DATE, SALARY, COMMISSION) VALUES
(101, NULL, 'Smith', 'John', 'Manager', 'Mr.', '1980-01-01', '2020-01-01', 6000.00, 0.10),
(102, 101, 'Doe', 'Jane', 'Sales Associate', 'Ms.', '1985-02-02', '2021-02-01', 4500.00, 0.05),
(103, 101, 'Johnson', 'Chris', 'Sales Associate', 'Mr.', '1990-03-03', '2021-03-01', 4500.00, 0.05),
(104, 101, 'Williams', 'Linda', 'Sales Associate', 'Ms.', '1982-04-04', '2021-04-01', 4500.00, 0.05),
(105, 101, 'Brown', 'Michael', 'Sales Associate', 'Mr.', '1975-05-05', '2021-05-01', 4500.00, 0.05),
(106, 101, 'Jones', 'Sarah', 'Sales Associate', 'Ms.', '1988-06-06', '2021-06-01', 4500.00, 0.05),
(107, 101, 'Garcia', 'James', 'Sales Associate', 'Mr.', '1995-07-07', '2021-07-01', 4500.00, 0.05),
(108, 101, 'Martinez', 'Patricia', 'Sales Associate', 'Ms.', '1993-08-08', '2021-08-01', 4500.00, 0.05),
(109, 101, 'Hernandez', 'Daniel', 'Sales Associate', 'Mr.', '1987-09-09', '2021-09-01', 4500.00, 0.05),
(110, 101, 'Lopez', 'Susan', 'Sales Associate', 'Ms.', '1992-10-10', '2021-10-01', 4500.00, 0.05),
(111, 101, 'Wilson', 'David', 'Sales Associate', 'Mr.', '1984-11-11', '2021-11-01', 4500.00, 0.05),
(112, 101, 'Anderson', 'Mary', 'Sales Associate', 'Ms.', '1986-12-12', '2021-12-01', 4500.00, 0.05),
(113, 101, 'Thomas', 'Charles', 'Sales Associate', 'Mr.', '1983-01-01', '2021-01-01', 4500.00, 0.05),
(114, 101, 'Jackson', 'Karen', 'Sales Associate', 'Ms.', '1991-02-02', '2021-02-01', 4500.00, 0.05),
(115, 101, 'White', 'Robert', 'Sales Associate', 'Mr.', '1989-03-03', '2021-03-01', 4500.00, 0.05),
(116, 101, 'Harris', 'Jessica', 'Sales Associate', 'Ms.', '1981-04-04', '2021-04-01', 4500.00, 0.05),
(117, 101, 'Martin', 'Matthew', 'Sales Associate', 'Mr.', '1982-05-05', '2021-05-01', 4500.00, 0.05),
(118, 101, 'Thompson', 'Nancy', 'Sales Associate', 'Ms.', '1980-06-06', '2021-06-01', 4500.00, 0.05),
(119, 101, 'Garcia', 'William', 'Sales Associate', 'Mr.', '1985-07-07', '2021-07-01', 4500.00, 0.05);
/*==============================================================*/
INSERT INTO CATEGORIES (CATEGORY_CODE, CATEGORY_NAME, DESCRIPTION) VALUES
(1, 'Beverages', 'Soft drinks, coffees, teas, beers, and ales'),
(2, 'Condiments', 'Sweet and savory sauces, relishes, spreads, and seasonings'),
(3, 'Confections', 'Candies and other sweets'),
(4, 'Dairy Products', 'Cheeses and dairy-related products'),
(5, 'Grains/Cereals', 'Breads, rice, grains, and breakfast cereals'),
(6, 'Meat/Poultry', 'Beef, pork, lamb, and poultry products'),
(7, 'Produce', 'Fruits and vegetables'),
(8, 'Seafood', 'Fish and other seafood products'),
(9, 'Baked Goods', 'Pastries, cakes, and baked items'),
(10, 'Frozen Foods', 'Frozen vegetables, ice creams, and other frozen goods'),
(11, 'Snacks', 'Chips, nuts, and other snack items'),
(12, 'Packaged Foods', 'Canned and jarred foods'),
(13, 'International', 'Global food items and exotic ingredients'),
(14, 'Organic', 'Organic and health-conscious food products'),
(15, 'Breakfast Foods', 'Items specifically for breakfast'),
(16, 'Sauces', 'Various types of sauces for cooking and serving'),
(17, 'Sweets', 'Desserts and sweet treats'),
(18, 'Herbs & Spices', 'Dried herbs and spices for flavoring'),
(19, 'Cooking Oils', 'Various oils for cooking and baking'),
(20, 'Soups', 'Canned and packaged soups'),
(21, 'Deli Meats', 'Processed meats for sandwiches and platters'),
(22, 'Canned Goods', 'Vegetables and meats in cans'),
(23, 'Instant Foods', 'Instant noodles and ready-to-eat meals'),
(24, 'Healthy Snacks', 'Health-focused snacks and energy bars'),
(25, 'Chocolates', 'Various types of chocolate products'),
(26, 'Baby Foods', 'Food products specifically for infants'),
(27, 'Pet Foods', 'Food for pets and animals'),
(28, 'Beverage Mixes', 'Powdered drink mixes and syrups'),
(29, 'Nuts', 'Various types of nuts'),
(30, 'Rice', 'Different varieties of rice'),
(31, 'Bread', 'Different types of bread'),
(32, 'Cheese', 'Various cheese products'),
(33, 'Frozen Meals', 'Frozen prepared meals'),
(34, 'Spices', 'Different types of cooking spices'),
(35, 'Cereal Bars', 'Snack bars made from cereals'),
(36, 'Tortillas', 'Various types of tortillas'),
(37, 'Fruit', 'Fresh and packaged fruits'),
(38, 'Vegetables', 'Fresh and packaged vegetables'),
(39, 'Legumes', 'Beans and other legumes'),
(40, 'Pickles', 'Various types of pickled vegetables'),
(41, 'Sauerkraut', 'Fermented cabbage'),
(42, 'Olives', 'Various types of olives'),
(43, 'Jams', 'Fruit preserves and jams'),
(44, 'Nut Butters', 'Peanut butter and other nut spreads'),
(45, 'Syrups', 'Various types of sweet syrups'),
(46, 'Tea', 'Various types of tea'),
(47, 'Coffee', 'Various types of coffee products'),
(48, 'Energy Drinks', 'High-caffeine beverages'),
(49, 'Functional Foods', 'Foods with health benefits'),
(50, 'Plant-Based', 'Plant-based food alternatives');



/*==============================================================*/

INSERT INTO CUSTOMERS (CUSTOMER_CODE, COMPANY, ADDRESS, CITY, POSTAL_CODE, COUNTRY, PHONE, FAX) VALUES
('C001', 'Acme Corporation', '123 Acme St.', 'New York', '10001', 'USA', '555-1234', '555-5678'),
('C002', 'Globex Corporation', '456 Globex Rd.', 'Los Angeles', '90001', 'USA', '555-2345', '555-6789'),
('C003', 'Initech', '789 Initech Ave.', 'Chicago', '60601', 'USA', '555-3456', '555-7890'),
('C004', 'Hooli', '135 Hooli Blvd.', 'San Francisco', '94101', 'USA', '555-4567', '555-8901'),
('C005', 'Umbrella Corporation', '246 Umbrella Way', 'Seattle', '98101', 'USA', '555-5678', '555-9012'),
('C006', 'Dunder Mifflin', '357 Dunder St.', 'Philadelphia', '19101', 'USA', '555-6789', '555-0123'),
('C007', 'Stark Industries', '468 Stark Ave.', 'Detroit', '48201', 'USA', '555-7890', '555-1234'),
('C008', 'Wayne Enterprises', '579 Wayne Rd.', 'Gotham', '10002', 'USA', '555-8901', '555-2345'),
('C009', 'Tyrell Corporation', '680 Tyrell Blvd.', 'Los Angeles', '90002', 'USA', '555-9012', '555-3456'),
('C010', 'Veridian Dynamics', '791 Veridian Way', 'Austin', '73301', 'USA', '555-0123', '555-4567'),
('C011', 'Frobozz Magic Company', '902 Frobozz Rd.', 'Denver', '80201', 'USA', '555-1234', '555-5678'),
('C012', 'Chachkis', '213 Chachki Way', 'Miami', '33101', 'USA', '555-2345', '555-6789'),
('C013', 'Vandelay Industries', '324 Vandelay St.', 'Boston', '02101', 'USA', '555-3456', '555-7890'),
('C014', 'Acme Widgets', '435 Widgets St.', 'Phoenix', '85001', 'USA', '555-4567', '555-8901'),
('C015', 'Hyperion Solutions', '546 Hyperion Blvd.', 'Dallas', '75201', 'USA', '555-5678', '555-9012'),
('C016', 'Neptune Inc.', '657 Neptune Ave.', 'San Diego', '92101', 'USA', '555-6789', '555-0123'),
('C017', 'Reed & Barton', '768 Reed Rd.', 'Atlanta', '30301', 'USA', '555-7890', '555-1234'),
('C018', 'Nakatomi Trading', '879 Nakatomi Way', 'Washington', '20001', 'USA', '555-8901', '555-2345'),
('C019', 'Tyler Durden Co.', '980 Tyler St.', 'Orlando', '32801', 'USA', '555-9012', '555-3456'),
('C020', 'Hammond Manufacturing', '101 Hammond Rd.', 'Salt Lake City', '84101', 'USA', '555-0123', '555-4567'),
('C021', 'Benson & Hedges', '112 Benson Blvd.', 'Portland', '97201', 'USA', '555-1234', '555-5678'),
('C022', 'Norton Corp.', '123 Norton St.', 'Las Vegas', '89101', 'USA', '555-2345', '555-6789'),
('C023', 'Simpsons Co.', '234 Simpsons Rd.', 'Cincinnati', '45201', 'USA', '555-3456', '555-7890'),
('C024', 'Pepperidge Farm', '345 Pepperidge Blvd.', 'Baltimore', '21201', 'USA', '555-4567', '555-8901'),
('C025', 'Wile E. Coyote Inc.', '456 Coyote Ave.', 'Seattle', '98102', 'USA', '555-5678', '555-9012'),
('C026', 'Omni Consumer Products', '567 OCP Blvd.', 'Denver', '80202', 'USA', '555-6789', '555-0123'),
('C027', 'Pawnee Parks Department', '678 Pawnee Rd.', 'Pawnee', '67901', 'USA', '555-7890', '555-1234'),
('C028', 'Acme Tools', '789 Tools St.', 'Memphis', '38101', 'USA', '555-8901', '555-2345'),
('C029', 'Sierra Trading', '890 Sierra Way', 'Salt Lake City', '84102', 'USA', '555-9012', '555-3456'),
('C030', 'Global Dynamics', '901 Global Rd.', 'Phoenix', '85002', 'USA', '555-0123', '555-4567'),
('C031', 'Enron Corp.', '123 Enron St.', 'Austin', '73302', 'USA', '555-1234', '555-5678'),
('C032', 'Xerox Corp.', '234 Xerox Rd.', 'New York', '10003', 'USA', '555-2345', '555-6789'),
('C033', 'Energizer Holdings', '345 Energizer Blvd.', 'Chicago', '60602', 'USA', '555-3456', '555-7890'),
('C034', 'Ford Motor Company', '456 Ford St.', 'Detroit', '48202', 'USA', '555-4567', '555-8901'),
('C035', 'Sony Electronics', '567 Sony Ave.', 'San Jose', '95101', 'USA', '555-5678', '555-9012'),
('C036', 'IBM Corporation', '678 IBM Rd.', 'Austin', '73303', 'USA', '555-6789', '555-0123'),
('C037', 'General Motors', '789 GM Blvd.', 'Detroit', '48203', 'USA', '555-7890', '555-1234'),
('C038', 'The Gap', '890 Gap St.', 'San Francisco', '94102', 'USA', '555-8901', '555-2345'),
('C039', 'American Airlines', '901 AA Rd.', 'Dallas', '75202', 'USA', '555-9012', '555-3456'),
('C040', 'Dell Technologies', '123 Dell Blvd.', 'Round Rock', '78664', 'USA', '555-0123', '555-4567'),
('C041', 'Costco Wholesale', '234 Costco Rd.', 'Seattle', '98103', 'USA', '555-1234', '555-5678'),
('C042', 'Walmart', '345 Walmart Ave.', 'Bentonville', '72716', 'USA', '555-2345', '555-6789'),
('C043', 'Nike', '456 Nike St.', 'Beaverton', '97005', 'USA', '555-3456', '555-7890'),
('C044', 'Starbucks', '567 Starbucks Blvd.', 'Seattle', '98104', 'USA', '555-4567', '555-8901'),
('C045', 'Target', '678 Target Rd.', 'Minneapolis', '55403', 'USA', '555-5678', '555-9012'),
('C046', 'McDonalds', '789 McDonald Rd.', 'Oak Brook', '60523', 'USA', '555-6789', '555-0123'),
('C047', 'Coca-Cola', '890 Coca-Cola St.', 'Atlanta', '30301', 'USA', '555-7890', '555-1234'),
('C048', 'PepsiCo', '901 Pepsi Rd.', 'Purchase', '10577', 'USA', '555-8901', '555-2345'),
('C049', 'Kraft Foods', '123 Kraft Blvd.', 'Northfield', '60093', 'USA', '555-9012', '555-3456'),
('C050', 'Nestle', '234 Nestle Ave.', 'Vevey', '1800', 'Switzerland', '555-0123', '555-4567');

/*==============================================================*/



INSERT INTO SUPPLIERS VALUES (1, 'Exotic Liquids', '49 Gilbert St.', 'London', 'EC1 4SD', 'Royaume-Uni', '(171) 555-2222', NULL);

INSERT INTO SUPPLIERS VALUES (2, 'Nouvelle-Orléans Cajun Delights', 'P.O. Box 78934', 'Nouvelle-Orléans', '70117', 'États-Unis', '(100) 555-4822', NULL);

INSERT INTO SUPPLIERS VALUES (3, 'Grandma Kelly''s Homestead', '707 Oxford Rd.', 'Ann Arbor', '48104', 'États-Unis', '(313) 555-5735', '(313) 555-3349');

INSERT INTO SUPPLIERS VALUES (4, 'Tokyo Traders', '9-8 SekimaiMusashino-shi', 'Tokyo', '100', 'Japon', '(03) 3555-5011', NULL);

INSERT INTO SUPPLIERS VALUES (5, 'Cooperativa de Quesos ''Las Cabras''', 'Calle del Rosal 4', 'Oviedo', '33007', 'Espagne', '(98) 598 76 54', NULL);

INSERT INTO SUPPLIERS VALUES (6, 'Mayumi''s', '92 SetsukoChuo-ku', 'Osaka', '545', 'Japon', '(06) 431-7877', NULL);

INSERT INTO SUPPLIERS VALUES (7, 'Pavlova, Ltd.', '74 Rose St.Moonie Ponds', 'Melbourne', '3058', 'Australie', '(059) 55-5450', '(03) 444-6588');

INSERT INTO SUPPLIERS VALUES (8, 'Specialty Biscuits, Ltd.', '29 King''s Way', 'Manchester', 'M14 GSD', 'Royaume-Uni', '(161) 555-4448', NULL);

INSERT INTO SUPPLIERS VALUES (9, 'PB Knäckebröd AB', 'Kaloadagatan 13', 'Göteborg', 'S-345 67', 'Suède', '031-987 65 43', '031-987 65 91');

INSERT INTO SUPPLIERS VALUES (10, 'Refrescos Americanas LTDA', 'Av. das Americanas 12.890', 'São Paulo', '5442', 'Brésil', '(11) 555 4640', NULL);

INSERT INTO SUPPLIERS VALUES (11, 'Heli Süßwaren GmbH & Co. KG', 'Tiergartenstraße 5', 'Berlin', '10785', 'Allemagne', '(010) 9984510', NULL);

INSERT INTO SUPPLIERS VALUES (12, 'Plutzer Lebensmittelgroßmärkte AG', 'Bogenallee 51', 'Frankfurt', '60439', 'Allemagne', '(069) 992755', NULL);

INSERT INTO SUPPLIERS VALUES (13, 'Nord-Ost-Fisch Handelsgesellschaft mbH', 'Frahmredder 112a', 'Cuxhaven', '27478', 'Allemagne', '(04721) 8713', '(04721) 8714');

INSERT INTO SUPPLIERS VALUES (14, 'Formaggi Fortini s.r.l.', 'Viale Dante, 75', 'Ravenna', '48100', 'Italie', '(0544) 60323', '(0544) 60603');

INSERT INTO SUPPLIERS VALUES (15, 'Norske Meierier', 'Hatlevegen 5', 'Sandvika', '1320', 'Norvège', '(0)2-953010', NULL);

INSERT INTO SUPPLIERS VALUES (16, 'Bigfoot Breweries', '3400 - 8th AvenueSuite 210', 'Bend', '97101', 'États-Unis', '(503) 555-9931', NULL);

INSERT INTO SUPPLIERS VALUES (17, 'Svensk Sjöföda AB', 'Brovallavägen 231', 'Stockholm', 'S-123 45', 'Suède', '08-123 45 67', NULL);

INSERT INTO SUPPLIERS VALUES (18, 'Aux joyeux ecclésiastiques', '203, Rue des Francs-Bourgeois', 'Paris', '75004', 'France', '01.03.83.00.68', '01.03.83.00.62');

INSERT INTO SUPPLIERS VALUES (19, 'New England Seafood Cannery', 'Order Processing Dept.2100 Paul Revere Blvd.', 'Boston', '02134', 'États-Unis', '(617) 555-3267', '(617) 555-3389');

INSERT INTO SUPPLIERS VALUES (20, 'Leka Trading', '471 Serangoon Loop, Suite #402', 'Singapore', '0512', 'Singapour', '555-8787', NULL);

INSERT INTO SUPPLIERS VALUES (21, 'Lyngbysild', 'LyngbysildFiskebakken 10', 'Lyngby', '2800', 'Danemark', '43844108', '43844115');

INSERT INTO SUPPLIERS VALUES (22, 'Zaanse Snoepfabriek', 'VerkoopRijnweg 22', 'Zaandam', '9999 ZZ', 'Pays-Bas', '(12345)1212', '(12345) 1210');

INSERT INTO SUPPLIERS VALUES (23, 'Karkki Oy', 'Valtakatu 12', 'Lappeenranta', '53120', 'Finlande', '(953) 10956', NULL);

INSERT INTO SUPPLIERS VALUES (24, 'G''day, Mate', '170 Prince Edward ParadeHunter''s Hill', 'Sydney', '2042', 'Australie', '(02) 555-4873', '(02) 555-4873');

INSERT INTO SUPPLIERS VALUES (25, 'Ma Maison', '2960 Rue St. Laurent', 'Montréal', 'H1J 1C3', 'Canada', '(514) 555-9022', NULL);

INSERT INTO SUPPLIERS VALUES (26, 'Pasta Buttini s.r.l.', 'Via dei Gelsomini, 153', 'Salerno', '84100', 'Italie', '(089) 6547665', '(089) 6547667');

INSERT INTO SUPPLIERS VALUES (27, 'Escargots Nouveaux', '22, rue H. Voiron', 'Montceau', '71300', 'France', '04.85.57.00.07', NULL);

INSERT INTO SUPPLIERS VALUES (28, 'Gai pâturage', 'Bat. B3, rue des Alpes', 'Annecy', '74000', 'France', '04.38.76.98.06', '04.38.76.98.58');

INSERT INTO SUPPLIERS VALUES (29, 'Forêts d''érables', '148 rue Chasseur', 'Ste-Hyacinthe', 'J2S 7S8', 'Canada', '(514) 555-2955', '(514) 555-2921');

INSERT INTO SUPPLIERS VALUES (30, 'Lenovo', '149 rue Chasseur', 'Ste-Hyacinthe', 'J2S 7S8', 'Canada', '(514) 555-2956', '(514) 555-2922');

INSERT INTO SUPPLIERS VALUES (31, 'Asus', '150 rue Chasseur', 'Ste-Hyacinthe', 'J2S 7S8', 'Canada', '(514) 555-2957', '(514) 555-2923');


/*==============================================================*/

INSERT INTO PRODUCTS (PRODUCT_REF, PRODUCT_NAME, SUPPLIER_NUMBER, CATEGORY_CODE, QUANTITY, UNIT_PRICE, UNITS_IN_STOCK, UNITS_ON_ORDER, UNAVAILABLE)
VALUES 
(1, 'Product A', 1001, 101, '100', 19.99, 50, 10, 0),
(2, 'Product B', 1002, 102, '200', 25.50, 75, 5, 0),
(3, 'Product C', 1003, 103, '150', 15.00, 100, 20, 0),
(4, 'Product D', 1004, 101, '120', 30.00, 60, 0, 1),
(5, 'Product E', 1005, 102, '200', 45.99, 80, 15, 0),
(6, 'Product F', 1001, 103, '250', 60.00, 90, 8, 0),
(7, 'Product G', 1002, 101, '175', 22.50, 110, 12, 0),
(8, 'Product H', 1003, 102, '300', 12.00, 150, 0, 1),
(9, 'Product I', 1004, 103, '100', 17.75, 45, 25, 0),
(10, 'Product J', 1005, 101, '50', 33.25, 70, 10, 0),
(11, 'Product K', 1001, 102, '200', 20.00, 95, 30, 0),
(12, 'Product L', 1002, 103, '150', 40.00, 85, 5, 0),
(13, 'Product M', 1003, 101, '175', 50.50, 110, 10, 0),
(14, 'Product N', 1004, 102, '250', 10.99, 60, 0, 1),
(15, 'Product O', 1005, 103, '300', 75.00, 80, 15, 0),
(16, 'Product P', 1001, 101, '100', 5.00, 100, 20, 0),
(17, 'Product Q', 1002, 102, '120', 15.50, 70, 8, 0),
(18, 'Product R', 1003, 103, '200', 9.99, 55, 25, 0),
(19, 'Product S', 1004, 101, '150', 99.99, 40, 5, 0),
(20, 'Product T', 1005, 102, '175', 35.00, 90, 10, 0),
(21, 'Product U', 1001, 103, '250', 30.00, 65, 0, 1),
(22, 'Product V', 1002, 101, '100', 45.99, 80, 15, 0),
(23, 'Product W', 1003, 102, '200', 60.00, 75, 10, 0),
(24, 'Product X', 1004, 103, '150', 20.50, 90, 5, 0),
(25, 'Product Y', 1005, 101, '175', 18.75, 110, 8, 0),
(26, 'Product Z', 1001, 102, '300', 12.50, 50, 20, 0),
(27, 'Product AA', 1002, 103, '100', 22.99, 65, 0, 1),
(28, 'Product AB', 1003, 101, '120', 49.99, 55, 10, 0),
(29, 'Product AC', 1004, 102, '150', 35.50, 70, 12, 0),
(30, 'Product AD', 1005, 103, '175', 29.00, 80, 5, 0),
(31, 'Product AE', 1001, 101, '200', 16.25, 95, 30, 0),
(32, 'Product AF', 1002, 102, '250', 42.00, 90, 0, 1),
(33, 'Product AG', 1003, 103, '150', 24.75, 60, 15, 0),
(34, 'Product AH', 1004, 101, '100', 11.50, 100, 10, 0),
(35, 'Product AI', 1005, 102, '175', 45.00, 75, 0, 1),
(36, 'Product AJ', 1001, 103, '200', 37.25, 80, 15, 0),
(37, 'Product AK', 1002, 101, '150', 19.99, 95, 5, 0),
(38, 'Product AL', 1003, 102, '175', 60.00, 90, 10, 0),
(39, 'Product AM', 1004, 103, '250', 32.00, 70, 0, 1),
(40, 'Product AN', 1005, 101, '100', 15.50, 85, 12, 0),
(41, 'Product AO', 1001, 102, '200', 28.99, 80, 5, 0),
(42, 'Product AP', 1002, 103, '150', 54.00, 95, 20, 0),
(43, 'Product AQ', 1003, 101, '120', 21.00, 65, 0, 1),
(44, 'Product AR', 1004, 102, '175', 39.99, 50, 10, 0),
(45, 'Product AS', 1005, 103, '250', 33.00, 100, 15, 0),
(46, 'Product AT', 1001, 101, '200', 12.50, 55, 25, 0),
(47, 'Product AU', 1002, 102, '150', 10.00, 70, 8, 0),
(48, 'Product AV', 1003, 103, '175', 48.99, 90, 0, 1),
(49, 'Product AW', 1004, 101, '100', 27.75, 65, 12, 0),
(50, 'Product AX', 1005, 102, '200', 20.00, 80, 5, 0);


/*==============================================================*/

INSERT INTO ORDERS (ORDER_NUMBER, CUSTOMER_CODE, EMPLOYEE_NUMBER, ORDER_DATE, SHIP_DATE, SHIPPING_COST) VALUES
(1, 'C001', 101, '2024-01-01', '2024-01-03', 5.99),
(2, 'C002', 102, '2024-01-02', '2024-01-04', 3.49),
(3, 'C003', 103, '2024-01-03', '2024-01-05', 7.99),
(4, 'C004', 104, '2024-01-04', '2024-01-06', 4.99),
(5, 'C005', 105, '2024-01-05', '2024-01-07', 6.99),
(6, 'C006', 106, '2024-01-06', '2024-01-08', 2.49),
(7, 'C007', 107, '2024-01-07', '2024-01-09', 5.99),
(8, 'C008', 108, '2024-01-08', '2024-01-10', 8.99),
(9, 'C009', 109, '2024-01-09', '2024-01-11', 1.99),
(10, 'C010', 110, '2024-01-10', '2024-01-12', 4.49),
(11, 'C011', 101, '2024-01-11', '2024-01-13', 3.99),
(12, 'C012', 102, '2024-01-12', '2024-01-14', 7.49),
(13, 'C013', 103, '2024-01-13', '2024-01-15', 5.49),
(14, 'C014', 104, '2024-01-14', '2024-01-16', 2.99),
(15, 'C015', 105, '2024-01-15', '2024-01-17', 9.99),
(16, 'C016', 106, '2024-01-16', '2024-01-18', 4.99),
(17, 'C017', 107, '2024-01-17', '2024-01-19', 1.49),
(18, 'C018', 108, '2024-01-18', '2024-01-20', 6.49),
(19, 'C019', 109, '2024-01-19', '2024-01-21', 3.29),
(20, 'C020', 110, '2024-01-20', '2024-01-22', 4.89),
(21, 'C021', 101, '2024-01-21', '2024-01-23', 5.39),
(22, 'C022', 102, '2024-01-22', '2024-01-24', 2.59),
(23, 'C023', 103, '2024-01-23', '2024-01-25', 8.79),
(24, 'C024', 104, '2024-01-24', '2024-01-26', 5.89),
(25, 'C025', 105, '2024-01-25', '2024-01-27', 9.49),
(26, 'C026', 106, '2024-01-26', '2024-01-28', 3.99),
(27, 'C027', 107, '2024-01-27', '2024-01-29', 7.99),
(28, 'C028', 108, '2024-01-28', '2024-01-30', 4.29),
(29, 'C029', 109, '2024-01-29', '2024-01-31', 2.79),
(30, 'C030', 110, '2024-01-30', '2024-02-01', 5.59),
(31, 'C031', 101, '2024-02-01', '2024-02-03', 8.29),
(32, 'C032', 102, '2024-02-02', '2024-02-04', 1.19),
(33, 'C033', 103, '2024-02-03', '2024-02-05', 6.19),
(34, 'C034', 104, '2024-02-04', '2024-02-06', 5.39),
(35, 'C035', 105, '2024-02-05', '2024-02-07', 4.49),
(36, 'C036', 106, '2024-02-06', '2024-02-08', 9.29),
(37, 'C037', 107, '2024-02-07', '2024-02-09', 3.39),
(38, 'C038', 108, '2024-02-08', '2024-02-10', 7.49),
(39, 'C039', 109, '2024-02-09', '2024-02-11', 2.99),
(40, 'C040', 110, '2024-02-10', '2024-02-12', 8.49),
(41, 'C041', 101, '2024-02-11', '2024-02-13', 1.99),
(42, 'C042', 102, '2024-02-12', '2024-02-14', 5.79),
(43, 'C043', 103, '2024-02-13', '2024-02-15', 6.29),
(44, 'C044', 104, '2024-02-14', '2024-02-16', 2.19),
(45, 'C045', 105, '2024-02-15', '2024-02-17', 4.39),
(46, 'C046', 106, '2024-02-16', '2024-02-18', 3.89),
(47, 'C047', 107, '2024-02-17', '2024-02-19', 5.59),
(48, 'C048', 108, '2024-02-18', '2024-02-20', 8.79),
(49, 'C049', 109, '2024-02-19', '2024-02-21', 1.29),
(50, 'C050', 110, '2024-02-20', '2024-02-22', 7.49);

/*==============================================================*/
INSERT INTO ORDER_DETAILS (ORDER_NUMBER, PRODUCT_REF, UNIT_PRICE, QUANTITY, DISCOUNT) VALUES
(1, 1001, 10.99, 2, 0.1),
(1, 1002, 15.99, 1, 0.05),
(2, 1003, 9.99, 3, 0.2),
(2, 1004, 12.99, 1, 0.1),
(3, 1005, 14.99, 2, 0.15),
(4, 1001, 10.99, 4, 0.05),
(5, 1002, 15.99, 5, 0.1),
(6, 1003, 9.99, 6, 0.2),
(7, 1004, 12.99, 3, 0.15),
(8, 1005, 14.99, 2, 0.1),
(9, 1001, 10.99, 1, 0.2),
(10, 1002, 15.99, 4, 0.05),
(11, 1003, 9.99, 5, 0.1),
(12, 1004, 12.99, 3, 0.1),
(13, 1005, 14.99, 2, 0.15),
(14, 1001, 10.99, 1, 0.2),
(15, 1002, 15.99, 4, 0.1),
(16, 1003, 9.99, 2, 0.2),
(17, 1004, 12.99, 6, 0.15),
(18, 1005, 14.99, 3, 0.1),
(19, 1001, 10.99, 5, 0.05),
(20, 1002, 15.99, 2, 0.1),
(21, 1003, 9.99, 1, 0.2),
(22, 1004, 12.99, 4, 0.1),
(23, 1005, 14.99, 3, 0.15),
(24, 1001, 10.99, 2, 0.05),
(25, 1002, 15.99, 1, 0.2),
(26, 1003, 9.99, 5, 0.1),
(27, 1004, 12.99, 2, 0.15),
(28, 1005, 14.99, 4, 0.1),
(29, 1001, 10.99, 1, 0.2),
(30, 1002, 15.99, 3, 0.1),
(31, 1003, 9.99, 5, 0.15),
(32, 1004, 12.99, 4, 0.1),
(33, 1005, 14.99, 2, 0.05),
(34, 1001, 10.99, 3, 0.2),
(35, 1002, 15.99, 2, 0.1),
(36, 1003, 9.99, 1, 0.05),
(37, 1004, 12.99, 4, 0.15),
(38, 1005, 14.99, 6, 0.1),
(39, 1001, 10.99, 5, 0.2),
(40, 1002, 15.99, 3, 0.1),
(41, 1003, 9.99, 1, 0.05),
(42, 1004, 12.99, 4, 0.15),
(43, 1005, 14.99, 2, 0.1),
(44, 1001, 10.99, 3, 0.2),
(45, 1002, 15.99, 2, 0.1),
(46, 1003, 9.99, 1, 0.05),
(47, 1004, 12.99, 4, 0.15),
(48, 1005, 14.99, 2, 0.1),
(49, 1001, 10.99, 1, 0.05),
(50, 1002, 15.99, 3, 0.1);

/*==============================================================*/

update PRODUCTS  set UNITS_IN_STOCK = NULL
where UNAVAILABLE = -1;
 

update PRODUCTS  set UNITS_ON_ORDER = NULL
where UNITS_ON_ORDER = 0;


update ORDERS set EMPLOYEE_NUMBER=7
where EMPLOYEE_NUMBER=2;


update ORDERS  set EMPLOYEE_NUMBER=3
where EMPLOYEE_NUMBER =5;

update ORDERS set EMPLOYEE_NUMBER=1
where EMPLOYEE_NUMBER=8;

update PRODUCTS set SUPPLIER_NUMBER= 1 
where PRODUCT_REF in ( select PRODUCT_REF
from PRODUCTS 
where CATEGORY_CODE in (select CATEGORY_CODE
                        from CATEGORIES 
                        where upper(CATEGORY_NAME)='BOISSONS'));


ALTER TABLE ORDERS ADD CONSTRAINT FK_ORDERS_CUSTOMERS 
FOREIGN KEY (CUSTOMER_CODE) REFERENCES CUSTOMERS (CUSTOMER_CODE);

--error here:
ALTER TABLE ORDERS ADD CONSTRAINT FK_ORDERS_EMPLOYEES  
FOREIGN KEY (EMPLOYEE_NUMBER) REFERENCES EMPLOYEES (EMPLOYEE_NUMBER);

ALTER TABLE ORDER_DETAILS ADD CONSTRAINT FK_ORDER_DETAILS_ORDERS 
FOREIGN KEY (ORDER_NUMBER) REFERENCES ORDERS  (ORDER_NUMBER);
--error here:
ALTER TABLE ORDER_DETAILS ADD CONSTRAINT FK_ORDER_DETAILS_PRODUCTS   
FOREIGN KEY (PRODUCT_REF) REFERENCES PRODUCTS  (PRODUCT_REF);

ALTER TABLE EMPLOYEES  ADD CONSTRAINT FK_EMPLOYEES_EMPLOYEES 
FOREIGN KEY (REPORTS_TO) REFERENCES EMPLOYEES (EMPLOYEE_NUMBER);

ALTER TABLE PRODUCTS ADD CONSTRAINT FK_PRODUCTS_CATEGORIE 
FOREIGN KEY (CATEGORY_CODE) REFERENCES CATEGORIES (CATEGORY_CODE);

ALTER TABLE PRODUCTS  ADD CONSTRAINT FK_PRODUCTS_SUPPLIERS  
FOREIGN KEY (SUPPLIER_NUMBER) REFERENCES SUPPLIERS (SUPPLIER_NUMBER);

--fixing the code :


SELECT COLUMN_NAME, DATA_TYPE, NUMERIC_PRECISION, NUMERIC_SCALE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'EMPLOYEES' AND COLUMN_NAME IN ('SALARY', 'COMMISSION');

------------------
-- Modify SALARY to allow larger values
ALTER TABLE EMPLOYEES
ALTER COLUMN SALARY DECIMAL(8, 2);  -- Adjust precision as needed

-- Modify COMMISSION to allow smaller decimal percentages
ALTER TABLE EMPLOYEES
ALTER COLUMN COMMISSION DECIMAL(4, 2);  -- Adjust precision as needed

--insert table employees again

INSERT INTO EMPLOYEES (EMPLOYEE_NUMBER, REPORTS_TO, LAST_NAME, FIRST_NAME, POSITION, TITLE, BIRTH_DATE, HIRE_DATE, SALARY, COMMISSION) VALUES
(101, NULL, 'Smith', 'John', 'Manager', 'Mr.', '1980-01-01', '2020-01-01', 6000.00, 0.10),
(102, 101, 'Doe', 'Jane', 'Sales Associate', 'Ms.', '1985-02-02', '2021-02-01', 4500.00, 0.05),
(103, 101, 'Johnson', 'Chris', 'Sales Associate', 'Mr.', '1990-03-03', '2021-03-01', 4500.00, 0.05),
(104, 101, 'Williams', 'Linda', 'Sales Associate', 'Ms.', '1982-04-04', '2021-04-01', 4500.00, 0.05),
(105, 101, 'Brown', 'Michael', 'Sales Associate', 'Mr.', '1975-05-05', '2021-05-01', 4500.00, 0.05),
(106, 101, 'Jones', 'Sarah', 'Sales Associate', 'Ms.', '1988-06-06', '2021-06-01', 4500.00, 0.05),
(107, 101, 'Garcia', 'James', 'Sales Associate', 'Mr.', '1995-07-07', '2021-07-01', 4500.00, 0.05),
(108, 101, 'Martinez', 'Patricia', 'Sales Associate', 'Ms.', '1993-08-08', '2021-08-01', 4500.00, 0.05),
(109, 101, 'Hernandez', 'Daniel', 'Sales Associate', 'Mr.', '1987-09-09', '2021-09-01', 4500.00, 0.05),
(110, 101, 'Lopez', 'Susan', 'Sales Associate', 'Ms.', '1992-10-10', '2021-10-01', 4500.00, 0.05),
(111, 101, 'Wilson', 'David', 'Sales Associate', 'Mr.', '1984-11-11', '2021-11-01', 4500.00, 0.05),
(112, 101, 'Anderson', 'Mary', 'Sales Associate', 'Ms.', '1986-12-12', '2021-12-01', 4500.00, 0.05),
(113, 101, 'Thomas', 'Charles', 'Sales Associate', 'Mr.', '1983-01-01', '2021-01-01', 4500.00, 0.05),
(114, 101, 'Jackson', 'Karen', 'Sales Associate', 'Ms.', '1991-02-02', '2021-02-01', 4500.00, 0.05),
(115, 101, 'White', 'Robert', 'Sales Associate', 'Mr.', '1989-03-03', '2021-03-01', 4500.00, 0.05),
(116, 101, 'Harris', 'Jessica', 'Sales Associate', 'Ms.', '1981-04-04', '2021-04-01', 4500.00, 0.05),
(117, 101, 'Martin', 'Matthew', 'Sales Associate', 'Mr.', '1982-05-05', '2021-05-01', 4500.00, 0.05),
(118, 101, 'Thompson', 'Nancy', 'Sales Associate', 'Ms.', '1980-06-06', '2021-06-01', 4500.00, 0.05),
(119, 101, 'Garcia', 'William', 'Sales Associate', 'Mr.', '1985-07-07', '2021-07-01', 4500.00, 0.05);

--chatgpt suggested modifications
ALTER TABLE ORDERS ADD CONSTRAINT FK_ORDERS_CUSTOMERS 
FOREIGN KEY (CUSTOMER_CODE) REFERENCES CUSTOMERS (CUSTOMER_CODE);

ALTER TABLE ORDERS ADD CONSTRAINT FK_ORDERS_EMPLOYEES  
FOREIGN KEY (EMPLOYEE_NUMBER) REFERENCES EMPLOYEES (EMPLOYEE_NUMBER);

ALTER TABLE ORDER_DETAILS ADD CONSTRAINT FK_ORDER_DETAILS_ORDERS 
FOREIGN KEY (ORDER_NUMBER) REFERENCES ORDERS (ORDER_NUMBER);

ALTER TABLE ORDER_DETAILS ADD CONSTRAINT FK_ORDER_DETAILS_PRODUCTS   
FOREIGN KEY (PRODUCT_REF) REFERENCES PRODUCTS (PRODUCT_REF);

ALTER TABLE EMPLOYEES ADD CONSTRAINT FK_EMPLOYEES_EMPLOYES 
FOREIGN KEY (REPORTS_TO) REFERENCES EMPLOYES (EMPLOYEE_NUMBER);

ALTER TABLE PRODUCTS ADD CONSTRAINT FK_PRODUCTS_CATEGORIE 
FOREIGN KEY (CATEGORY_CODE) REFERENCES CATEGORIES (CATEGORY_CODE);

ALTER TABLE PRODUCTS ADD CONSTRAINT FK_PRODUCTS_SUPPLIERS  
FOREIGN KEY (SUPPLIER_NUMBER) REFERENCES SUPPLIERS (SUPPLIER_NUMBER);

update CATEGORIES set CATEGORY_CODE = CATEGORY_CODE + 100;
update SUPPLIERS SET SUPPLIER_NUMBER  = SUPPLIER_NUMBER + 1000;
update PRODUCTS SET PRODUCT_REF  = PRODUCT_REF + 1000;




select*from	ORDERS
select*from EMPLOYEES
select*from CUSTOMERS
select*from PRODUCTS
select*from CATEGORIES
select*from ORDER_DETAILS
select*from SUPPLIERS






--Questions
--3. descending order in terms of salary 
select EMPLOYEE_NUMBER, FIRST_NAME, LAST_NAME, (YEAR(getdate()) - year(BIRTH_DATE)) as 'AGE', (YEAR(getdate()) - year(HIRE_DATE)) as 'SENIORITY'
from EMPLOYEES
where (SALARY >= 4000 and TITLE = 'Mr.')
order by (YEAR(getdate()) - year(HIRE_DATE)) desc;

--4.  Display product criteria
	--C1 : quantity packaged in bottles
	select PRODUCT_REF, PRODUCT_NAME AS 'C1', CATEGORIES.CATEGORY_CODE
	from PRODUCTS 
	inner join CATEGORIES 
	on PRODUCTS.CATEGORY_CODE = CATEGORIES.CATEGORY_CODE
	where CATEGORIES.CATEGORY_CODE =101;
	
	--C2: the third character in the product name is 't' or 'T'
	--modifying this to : the 9th or 10th character is a T 
	select PRODUCT_NAME as 'C2' FROM PRODUCTS
	where PRODUCT_NAME LIKE upper('%t')

	--(C3) supplied by suppliers 1, 2, or 3
	select PRODUCT_NAME as 'C3' FROM PRODUCTS WHERE SUPPLIER_NUMBER in (1001, 1002, 1003);
	
	--(C4) unit price ranges between 70 and 200 -- modifying this to between 10 and 15
	select PRODUCT_NAME as 'C4' from PRODUCTS WHERE UNIT_PRICE BETWEEN 10 AND 15;
	
	--(C5) units ordered are specified (not null)
	select PRODUCT_NAME AS 'C5' FROM PRODUCTS WHERE UNITS_IN_STOCK IS NOT NULL;


 -- displaying the whole thing
select PRODUCT_REF, CATEGORIES.CATEGORY_NAME as C1, PRODUCT_NAME as C2, SUPPLIER_NUMBER AS C3, UNIT_PRICE AS C4, UNITS_IN_STOCK AS C5
FROM PRODUCTS
inner JOIN  CATEGORIES ON PRODUCTS.CATEGORY_CODE = CATEGORIES.CATEGORY_CODE 
WHERE 
    CATEGORIES.CATEGORY_CODE = 101
    AND PRODUCT_NAME LIKE UPPER('%t')
    AND SUPPLIER_NUMBER IN (1001, 1002, 1003)
    AND UNIT_PRICE BETWEEN 10 AND 15
    AND UNITS_IN_STOCK IS NOT NULL;


--5. customers who reside in the same region as supplier 1

	-- select data from suppliers : supplier 1:
	select ADDRESS as 'address supplier', CITY, POSTAL_CODE, COUNTRY FROM SUPPLIERS WHERE SUPPLIER_NUMBER = 1;

	--Updating	CITY and POSTAL_CODE just to test the solution code:
	update SUPPLIERS set CITY = 'Seattle', POSTAL_CODE = 98104  where SUPPLIER_NUMBER = 1;


	-- the solution to : --5. customers who reside in the same region as supplier 1

	SELECT ADDRESS, CITY, POSTAL_CODE, COUNTRY FROM CUSTOMERS 
	WHERE CITY IN (select CITY FROM SUPPLIERS WHERE SUPPLIER_NUMBER = 1)
	AND POSTAL_CODE IN (select POSTAL_CODE FROM SUPPLIERS WHERE SUPPLIER_NUMBER = 1) 


	-- Undoing the updates:
	update SUPPLIERS set CITY = 'London' , POSTAL_CODE = 'EC1 4SD' where SUPPLIER_NUMBER = 1;


--6. condition on discount rate for products between 10998 & 11003


select ORDER_NUMBER, 
	UNIT_PRICE*QUANTITY as 'full price', 
	DISCOUNT*100 AS 'OLD DISCOUNT RATE',
	DISCOUNT*100 AS 'New Discount Rate %',
	'Apply old discount Rate' as 'Action'	
FROM ORDER_DETAILS 
WHERE ORDER_NUMBER BETWEEN 1 AND 9

UNION
select ORDER_NUMBER, 
	UNIT_PRICE*QUANTITY as 'full price', 
	DISCOUNT*100 AS 'OLD DISCOUNT RATE',
	DISCOUNT*100 AS 'New Discount Rate %',
	'Apply old discount Rate' as 'Action'	
FROM ORDER_DETAILS 
WHERE UNIT_PRICE*QUANTITY <= 10 
AND ORDER_NUMBER BETWEEN 10 AND 50

UNION
select ORDER_NUMBER, 
	UNIT_PRICE*QUANTITY as 'full price', 
	DISCOUNT*100 AS 'OLD DISCOUNT RATE',
	DISCOUNT*100+5 AS 'New Discount Rate %',
	'Apply new discount Rate' as 'Action'
FROM ORDER_DETAILS 
WHERE UNIT_PRICE*QUANTITY BETWEEN 11 AND 20
AND ORDER_NUMBER BETWEEN 10 AND 50


UNION
select ORDER_NUMBER, 
	UNIT_PRICE*QUANTITY as 'full price', 
		DISCOUNT*100 AS 'OLD DISCOUNT RATE' ,
	DISCOUNT*100+10 AS 'New Discount Rate %',
	'Apply new discount Rate' as 'Action'
FROM ORDER_DETAILS 
WHERE UNIT_PRICE*QUANTITY BETWEEN 21 AND 30
AND ORDER_NUMBER BETWEEN 10 AND 50


UNION
select ORDER_NUMBER, 
	UNIT_PRICE*QUANTITY as 'full price', 
		DISCOUNT*100 AS 'OLD DISCOUNT RATE' ,
	DISCOUNT*100+15 AS 'New Discount Rate %',
	'Apply new discount Rate' as 'Action'
FROM ORDER_DETAILS 
WHERE UNIT_PRICE*QUANTITY >=31  AND ORDER_NUMBER BETWEEN 10 AND 50

ORDER BY ORDER_NUMBER ASC 





--7 Display suppliers of beverage products. The resulting table should display the columns: supplier number, company, address, and phone number.

SELECT 
	PRODUCTS.SUPPLIER_NUMBER,
	PRODUCT_NAME,
	CATEGORY_CODE,
	COMPANY,
	ADDRESS,
	SUPPLIERS.PHONE
FROM PRODUCTS 
inner join SUPPLIERS
ON SUPPLIERS.SUPPLIER_NUMBER = PRODUCTS.SUPPLIER_NUMBER
WHERE PRODUCTS.CATEGORY_CODE = 101;



-- 8. Display customers from Berlin who have ordered at most 1 (0 or 1) dessert product. The resulting table should display the column: customer code.
	--modified it to 'seattle'

SELECT 
	ORDERS.CUSTOMER_CODE,
	CATEGORY_CODE,
	PRODUCTS.PRODUCT_REF,
	ORDER_DETAILS.QUANTITY,
	CUSTOMERS.CITY
	
	
FROM PRODUCTS 
INNER JOIN ORDER_DETAILS
ON ORDER_DETAILS.PRODUCT_REF = PRODUCTS.PRODUCT_REF
INNER JOIN ORDERS
ON ORDERS.ORDER_NUMBER = ORDER_DETAILS.ORDER_NUMBER
INNER JOIN CUSTOMERS
ON CUSTOMERS.CUSTOMER_CODE = ORDERS.CUSTOMER_CODE


WHERE 
	PRODUCTS.CATEGORY_CODE = 103 
	AND ORDER_DETAILS.QUANTITY <=1 
	AND CITY = 'Seattle'


--9. Display customers who reside in France and the total amount of orders they placed every Monday in April 1998 
	--(considering customers who haven't placed any orders yet). 
	--The resulting table should display the columns: customer number, company name, phone number, total amount, and country.
	
	
	--changed it to customers who reside in switzeland

SELECT 
	CUSTOMERS.CUSTOMER_CODE, 
	COMPANY, 
	PHONE, 
	COUNTRY, 
	COUNT(ORDERS.ORDER_NUMBER) 'number of orders' ,
	SUM(ORDER_DETAILS.UNIT_PRICE * ORDER_DETAILS.QUANTITY + SHIPPING_COST) as 'Total amount'
FROM CUSTOMERS
INNER JOIN ORDERS
ON ORDERS.CUSTOMER_CODE = CUSTOMERS.CUSTOMER_CODE
INNER JOIN ORDER_DETAILS
ON ORDER_DETAILS.ORDER_NUMBER = ORDERS.ORDER_NUMBER
GROUP BY CUSTOMERS.CUSTOMER_CODE, COUNTRY, ORDERS.ORDER_NUMBER , CUSTOMERS.COMPANY, PHONE, COUNTRY, UNIT_PRICE
HAVING COUNTRY = 'Switzerland'


--10. Display customers who have ordered all products. 
	--The resulting table should display the columns: customer code, company name, and telephone number.
	-- since there aren't any customer who ordered all products, I left chose 2 products instead of all products

SELECT CUSTOMERS.CUSTOMER_CODE, count(PRODUCT_REF) "Num of orders" , COMPANY, PHONE FROM CUSTOMERS
INNER JOIN ORDERS
ON ORDERS.CUSTOMER_CODE = CUSTOMERS.CUSTOMER_CODE
INNER JOIN ORDER_DETAILS
ON ORDER_DETAILS.ORDER_NUMBER = ORDERS.ORDER_NUMBER
group by CUSTOMERS.CUSTOMER_CODE, COMPANY, PHONE
having count(PRODUCT_REF) >=2;


-- 11. Display for each customer from France the number of orders they have placed. The resulting table should display the columns: customer code and number of orders.
	-- changed france to USA

SELECT CUSTOMERS.CUSTOMER_CODE, count(PRODUCT_REF) "Num of orders" FROM CUSTOMERS
INNER JOIN ORDERS
ON ORDERS.CUSTOMER_CODE = CUSTOMERS.CUSTOMER_CODE
INNER JOIN ORDER_DETAILS
ON ORDER_DETAILS.ORDER_NUMBER = ORDERS.ORDER_NUMBER
group by CUSTOMERS.CUSTOMER_CODE, COUNTRY
having COUNTRY = 'USA' ;




-- 12. Display the number of orders placed in 1996 (changed to 2020), 
--the number of orders placed in 1997 (in this case 2024), 
--and the difference between these two numbers. The resulting table should display the columns: orders in 1996, orders in 1997, and Difference.

--updating one row to make the difference:
UPDATE ORDERS SET ORDER_DATE = '2020-12-23' where ORDER_NUMBER = 46;
----
--solution to question 11:
-- not the correct answer
select 
	count(ORDER_NUMBER) as "Orders in 2020", 
	year(ORDER_DATE) as 'Order year' 
from ORDERS 
where year(ORDER_DATE) = 2020 or year(ORDER_DATE) = 2024
group by year(ORDER_DATE);


	

-- the correct answer
SELECT 
	COUNT(CASE WHEN YEAR(ORDER_DATE) =2020 THEN ORDER_NUMBER END) AS 'ORDERS IN 2020',
	COUNT(CASE WHEN YEAR(ORDER_DATE) = 2024 THEN ORDER_NUMBER END) AS 'ORDERS IN 2024',
	ABS(COUNT(CASE WHEN YEAR(ORDER_DATE) =2020 THEN ORDER_NUMBER END) - COUNT(CASE WHEN YEAR(ORDER_DATE) = 2024 THEN ORDER_NUMBER END)) as 'DIFFERENCE'
FROM ORDERS;






























































