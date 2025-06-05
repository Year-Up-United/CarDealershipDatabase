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

-- STEP 8 (populate the vehicle table)
INSERT INTO VEHICLES (VIN, MAKE, MODEL, YEAR, COLOR, ODOMETER, SOLD) VALUES
('1HGCM8263RA004001', 'Mercedes-Benz', 'S-Class S580', 2024, 'Obsidian Black Metallic', '2,300 miles', FALSE),
('WBA13BJ09RCK30001', 'BMW', '7 Series 760i xDrive', 2024, 'Mineral White Metallic', '1,800 miles', FALSE),
('WA1VABFY2RD005001', 'Audi', 'Q8 e-tron Prestige', 2025, 'Chronos Gray Metallic', '900 miles', FALSE),
('5YJSA1E54RF200101', 'Tesla', 'Model S Plaid', 2025, 'Deep Blue Metallic', '1,000 miles', FALSE),
('4JGFF8KE7RB123456', 'Mercedes-Benz', 'GLS 580 4MATIC', 2024, 'Emerald Green Metallic', '3,000 miles', FALSE),
('ZFF99SFA6R0298765', 'Ferrari', 'Roma Spider', 2024, 'Rosso Corsa', '700 miles', FALSE),
('SCFRMFCW3RGL10010', 'Aston Martin', 'DB12 Coupe', 2025, 'Ultramarine Black', '600 miles', FALSE),
('JTHH81FF2R5000001', 'Lexus', 'LC 500h Coupe', 2024, 'Infrared', '1,200 miles', FALSE),
('WDDUG8DB7RA005678', 'Mercedes-Maybach', 'S680 4MATIC', 2024, 'Rubellite Red', '500 miles', FALSE),
('YV1ED3GL7R1220045', 'Volvo', 'EX90 Twin Ultimate', 2025, 'Denim Blue', '1,100 miles', FALSE),
('SCCPC1118RHL00001', 'Lotus', 'Emira V6 First Edition', 2025, 'Seneca Blue', '100 miles', TRUE),
('WDDZH8JB1RA123456', 'Mercedes-Benz', 'E-Class E53 AMG', 2025, 'Graphite Grey Metallic', '250 miles', TRUE),
('WAUBFCF56RN000111', 'Audi', 'RS 5 Sportback', 2024, 'Tango Red Metallic', '300 miles', TRUE),
('ZFF90FPA6R0299001', 'Ferrari', 'F8 Tributo', 2024, 'Rosso Fiorano', '150 miles', TRUE),
('SCAXXX401RC123789', 'Rolls-Royce', 'Phantom Extended', 2025, 'Arctic White', '180 miles', TRUE),
('WBA33FJ05RCK99999', 'BMW', 'M8 Competition Coupe', 2024, 'Frozen Marina Bay Blue', '220 miles', TRUE),
('JTHGZ1B20R5023456', 'Lexus', 'IS 500 F Sport Performance', 2025, 'Molten Pearl', '275 miles', TRUE),
('ZAM45VMA9R0123456', 'Maserati', 'MC20 Cielo', 2024, 'Nero Enigma', '120 miles', TRUE),
('SADB12EX6RA445566', 'Jaguar', 'F-Type R75 Coupe', 2024, 'British Racing Green', '210 miles', TRUE),
('4JGFF8FE7RA654321', 'Mercedes-Maybach', 'GLS 600 4MATIC', 2025, 'Obsidian Black Metallic', '200 miles', TRUE);

-- STEP 9 (populate the inventory table)
-- DOLLS DEALERSHIP (ID = 1)
INSERT INTO INVENTORY (dealership_id, VIN) VALUES
(1, '1HGCM8263RA004001'),
(1, '5YJSA1E54RF200101'),
(1, 'SCCPC1118RHL00001'),
(1, 'WDDZH8JB1RA123456'),
(1, 'WAUBFCF56RN000111');

-- LUXURY CARS (ID = 2)
INSERT INTO INVENTORY (dealership_id, VIN) VALUES
(2, 'WBA13BJ09RCK30001'),
(2, 'SCFRMFCW3RGL10010'),
(2, 'ZFF90FPA6R0299001'),
(2, 'SCAXXX401RC123789');

-- PRETTY GIRL CARS (ID = 3)
INSERT INTO INVENTORY (dealership_id, VIN) VALUES
(3, '4JGFF8KE7RB123456'),
(3, 'ZFF99SFA6R0298765'),
(3, 'WBA33FJ05RCK99999');

-- DOLLS AUTO (ID = 4)
INSERT INTO INVENTORY (dealership_id, VIN) VALUES
(4, 'WA1VABFY2RD005001'),
(4, 'JTHGZ1B20R5023456'),
(4, 'ZAM45VMA9R0123456');

-- FANCY CLUB MOTORS (ID = 5)
INSERT INTO INVENTORY (dealership_id, VIN) VALUES
(5, 'WDDUG8DB7RA005678'),
(5, 'SADB12EX6RA445566');

-- DIVA RIDES (ID = 6)
INSERT INTO INVENTORY (dealership_id, VIN) VALUES
(6, 'JTHH81FF2R5000001'),
(6, '4JGFF8FE7RA654321');

-- GLAM WHEELS (ID = 7)
INSERT INTO INVENTORY (dealership_id, VIN) VALUES
(7, 'YV1ED3GL7R1220045');

-- STEP 10 (populate the sales contract table)
INSERT INTO SALES_CONTRACT (customer_name, salesTax, recordingFee, processingFee, isFinance, date_of_sale, VIN) VALUES
-- DOLLS DEALERSHIP (ID = 1)
('Jasmine Taylor', 7200.00, 200, 350, TRUE, 20250607, 'SCCPC1118RHL00001'),
('Kayla Johnson', 8600.75, 225, 375, TRUE, 20250607, 'WDDZH8JB1RA123456'),
('Madison Grant', 7400.50, 215, 360, TRUE, 20250608, 'WAUBFCF56RN000111'),

-- LUXURY CARS (ID = 2)
('Ariana Singh', 14450.00, 300, 400, TRUE, 20250608, 'ZFF90FPA6R0299001'),
('Sierra Bennett', 17200.80, 325, 420, TRUE, 20250608, 'SCAXXX401RC123789');


-- STEP 11 (populate the lease table)
INSERT INTO lease_contracts (customer_name, extendedEndingValue, leaseFee, monthlyPayment, date_of_sale, VIN) VALUES
('Claire Lee', 41500.00, 900.00, 1200.00, 20250609, 'JTHGZ1B20R5023456'),
('Riley Morgan', 49000.00, 990.00, 1400.00, 20250609, 'ZAM45VMA9R0123456'),
('Lillian Reed', 38000.00, 875.00, 1150.00, 20250610, 'SADB12EX6RA445566'),
('Maya Carter', 45000.00, 950.00, 1300.00, 20250610, '4JGFF8FE7RA654321'),
('Natalie Diaz', 47000.00, 970.00, 1350.00, 20250610, 'WBA33FJ05RCK99999');
