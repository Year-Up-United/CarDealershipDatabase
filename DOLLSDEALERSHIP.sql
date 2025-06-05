-- JAYLA JONES (CAR DEALERSHIP DATABASE)
DROP DATABASE CarDealershipDatabase;

-- STEP 1 (create the database)
CREATE DATABASE
CarDealershipDatabase;

-- allows database created to be used 
USE CarDealershipDatabase;

-- STEP 2 (create the table for dealerships)
CREATE TABLE DEALERSHIPS (
dealership_id INT AUTO_INCREMENT PRIMARY KEY,
name VARCHAR(50),
address VARCHAR(50),
phone VARCHAR(12)
);

-- STEP 3 (create the table for vehicles)
CREATE TABLE VEHICLES (
VIN VARCHAR(17) PRIMARY KEY,
MAKE VARCHAR(50),
MODEL VARCHAR(50),
YEAR  INT,
COLOR VARCHAR(30),
ODOMETER VARCHAR(50),
SOLD BOOLEAN NOT NULL DEFAULT FALSE
);

-- STEP 4 (create table for inventory)
CREATE TABLE INVENTORY (
    dealership_id INT,
    VIN CHAR(17),
    PRIMARY KEY (dealership_id, VIN)
);

-- STEP 5 (create table for sales contract CUSTOMER NAME, CUSTOMER EMAIL)
CREATE TABLE SALES_CONTRACT (
    contract_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_name VARCHAR(100),
    salesTax DECIMAL(10,2),
    recordingFee INT,
    processingFee INT,
    isFinance BOOLEAN,
    date_of_sale INT,
    VIN CHAR(17),
    FOREIGN KEY (VIN) REFERENCES VEHICLES (VIN)
);

-- STEP 6 (create table for the lease contract)
CREATE TABLE lease_contracts (
    contract_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_name VARCHAR(100),
    extendedEndingValue DECIMAL(10,2),
    leaseFee DECIMAL(10,2),
    monthlyPayment DECIMAL(10,2),
    date_of_sale INT,
    VIN VARCHAR(17),
    FOREIGN KEY (vin) REFERENCES vehicles(vin)
);

-- STEP 7 (populate the dealership table)
INSERT INTO DEALERSHIPS (name, address, phone) VALUES
('DOLLS DEALERSHIP', '111 DUPONT CIRCLE','212-222-3322'),
('LUXURY CARS', '222 DEAN ST', '212-111-2211'),
('PRETTY GIRL CARS', '333 JONES AVE', '212-333-2233'),
('DOLLS AUTO', '444 MERCER ST', '212-444-2244'),
('FANCY CLUB MOTORS', '555 YORK AVE', '212-555-2255'),
('DIVA RIDES', '616 ATLANTIC AVE', '212-616-2266'),
('GLAM WHEELS', '777 DOLL ST', '212-777-2277');




