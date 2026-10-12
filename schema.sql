-- =========================================================
-- 1. PRODUCT CATALOG DIRECTORY (Dim_Products)
-- =========================================================
CREATE TABLE Dim_Products (
    ProductID VARCHAR(50) PRIMARY KEY,
    ProductName VARCHAR(150),
    Category VARCHAR(100),
    UnitCost DECIMAL(10,2),
    StorageType VARCHAR(50)
);

INSERT INTO Dim_Products VALUES ('PROD-001', 'Industrial Valve', 'Spare Parts', 45.00, 'Ambient');
INSERT INTO Dim_Products VALUES ('PROD-002', 'Pharmaceutical Grade Vaccine', 'Medical', 120.00, 'Cold Chain');
INSERT INTO Dim_Products VALUES ('PROD-003', 'Lithium-Ion Battery Pack', 'Electronics', 85.00, 'Hazardous');

-- =========================================================
-- 2. LOGISTICS PROVIDER DIRECTORY (Dim_Carriers)
-- =========================================================
CREATE TABLE Dim_Carriers (
    CarrierID VARCHAR(50) PRIMARY KEY,
    CarrierName VARCHAR(100),
    TransportMode VARCHAR(50),
    SLA_Agreement_Days INT
);

INSERT INTO Dim_Carriers VALUES ('CR-101', 'BlueDart Logistics', 'Road', 4);
INSERT INTO Dim_Carriers VALUES ('CR-102', 'DTDC Express', 'Air', 3);
INSERT INTO Dim_Carriers VALUES ('CR-103', 'Delhivery Corporate', 'Rail', 5);

-- =========================================================
-- 3. MASTER SHIPPING LEDGER (Fact_orders)
-- =========================================================
CREATE TABLE Fact_orders (
    OrderID INT PRIMARY KEY,
    CustomerID VARCHAR(50),
    ProductID VARCHAR(50),
    CarrierID VARCHAR(50),
    WarehouseLocation VARCHAR(100),
    OrderQty INT,
    DeliveredQty INT,
    OrderDate DATE,
    PromisedDeliveryDate DATE,
    ActualDeliveryDate DATE NULL
);

INSERT INTO Fact_orders VALUES (1001, 'CUST-901', 'PROD-001', 'CR-101', 'Mumbai Hub', 500, 500, '2026-09-01', '2026-09-05', '2026-09-04');
INSERT INTO Fact_orders VALUES (1002, 'CUST-902', 'PROD-002', 'CR-102', 'Chennai Hub', 1200, 1000, '2026-09-01', '2026-09-06', '2026-09-05');
INSERT INTO Fact_orders VALUES (1003, 'CUST-903', 'PROD-001', 'CR-103', 'Delhi Hub', 250, 250, '2026-09-02', '2026-09-05', '2026-09-07');
INSERT INTO Fact_orders VALUES (1004, 'CUST-904', 'PROD-003', 'CR-101', 'Mumbai Hub', 800, 800, '2026-09-03', '2026-09-08', NULL);
INSERT INTO Fact_orders VALUES (1005, 'CUST-901', 'PROD-002', 'CR-103', 'Delhi Hub', 400, 350, '2026-09-04', '2026-09-08', '2026-09-09');
INSERT INTO Fact_orders VALUES (1006, 'CUST-905', 'PROD-003', 'CR-102', 'Chennai Hub', 950, 950, '2026-09-05', '2026-09-10', '2026-09-09');
INSERT INTO Fact_orders VALUES (1007, 'CUST-902', 'PROD-001', 'CR-101', 'Mumbai Hub', 600, 600, '2026-09-06', '2026-09-10', '2026-09-11');
INSERT INTO Fact_orders VALUES (1008, 'CUST-903', 'PROD-003', 'CR-102', 'Chennai Hub', 150, 150, '2026-09-07', '2026-09-12', NULL);
INSERT INTO Fact_orders VALUES (1009, 'CUST-905', 'PROD-002', 'CR-103', 'Delhi Hub', 750, 750, '2026-09-08', '2026-09-12', '2026-09-11');
INSERT INTO Fact_orders VALUES (1010, 'CUST-904', 'PROD-001', 'CR-101', 'Mumbai Hub', 300, 200, '2026-09-09', '2026-09-13', '2026-09-14');
