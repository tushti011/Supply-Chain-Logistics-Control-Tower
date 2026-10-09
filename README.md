End-to-End Supply Chain Fulfillment & Logistics Control Tower

Project Overview
This project functions as a logistical control tower dashboard designed to monitor global shipment timelines, evaluate third-party logistics (3PL) fulfillment, and mitigate inventory stockout risks. Built entirely in a cloud ecosystem (Microsoft Fabric / Power BI Web) to bypass local OS hardware restrictions.

Complete Interactive Project Visuals
Below is the live execution mapping of the multi-page control tower dashboard built inside our operational cloud framework:

![Supply Chain Control Tower Dashboard](https://github.com/tushti011/Supply-Chain-Logistics-Control-Tower/issues/1#issue-5779946232)



Dashboard Page Breakdown & Operational Value

1. KPI Overview 
* **Operational Value:** This page functions as the executive entry point. It answers "what happened" across the global network. It allows senior managers to immediately evaluate total processing volume and track which regional distribution hubs (Mumbai, Chennai, Delhi) are handling the highest transactional workloads.

2. Carrier SLA Performance 
* **Operational Value:** This page handles third-party logistics (3PL) governance. By combining geographical distribution markers with carrier dimensions (BlueDart, DTDC, Delhivery), operations teams can evaluate lane efficiency, identify routing bottlenecks, and hold shipping vendors strictly accountable to contractual transit timelines.

3. Inventory & Supply Health 
* **Operational Value:** This page answers "why" fulfillment gaps occur. Instead of focusing on logistics delays, it tracks material shortages and inventory deficits. By contrasting exactly what the customer ordered against what the warehouse picked and shipped, it automatically isolates stockouts (e.g., vaccine cold-chain short-shipments) before they disrupt assembly lines.

Technical Architecture (Star Schema)
The database structure is engineered using a professional relational Star Schema:
* **Fact_orders (Core Transactions):** Stores operational delivery metrics, volumes, and regional distribution hub data.
* **Dim_Carriers (Logistics Context):** Stores courier names, transit modes, and SLA agreements.
* **Dim_Products (Product Catalog):** Tracks storage conditions (Cold Chain, Ambient, Hazardous) and costs.
### Sample Database Record Ledger (Fact_orders)
This layout mirrors how the raw transactions sit inside the repository dataset:

Complete Project Datasets

### 1. Master Shipping Ledger (`Fact_orders`)
*This core ledger tracks daily shipping logs, volumetric workloads, and delivery timestamps.*

| OrderID | CustomerID | ProductID | CarrierID | WarehouseLocation | OrderQty | DeliveredQty | OrderDate | PromisedDeliveryDate | ActualDeliveryDate |
| :--- | :--- | :--- | :--- | :--- | :--- | :--- | :--- | :--- | :--- |
| **1001** | CUST-901 | PROD-001 | CR-101 | Mumbai Hub | 500 | 500 | 2026-09-01 | 2026-09-05 | 2026-09-04 |
| **1002** | CUST-902 | PROD-002 | CR-102 | Chennai Hub | 1200 | 1000 | 2026-09-01 | 2026-09-06 | 2026-09-05 |
| **1003** | CUST-903 | PROD-001 | CR-103 | Delhi Hub | 250 | 250 | 2026-09-02 | 2026-09-05 | 2026-09-07 |
| **1004** | CUST-904 | PROD-003 | CR-101 | Mumbai Hub | 800 | 800 | 2026-09-03 | 2026-09-08 | *In-Transit* |
| **1005** | CUST-901 | PROD-002 | CR-103 | Delhi Hub | 400 | 350 | 2026-09-04 | 2026-09-08 | 2026-09-09 |
| **1006** | CUST-905 | PROD-003 | CR-102 | Chennai Hub | 950 | 950 | 2026-09-05 | 2026-09-10 | 2026-09-09 |
| **1007** | CUST-902 | PROD-001 | CR-101 | Mumbai Hub | 600 | 600 | 2026-09-06 | 2026-09-10 | 2026-09-11 |
| **1008** | CUST-903 | PROD-003 | CR-102 | Chennai Hub | 150 | 150 | 2026-09-07 | 2026-09-12 | *In-Transit* |
| **1009** | CUST-905 | PROD-002 | CR-103 | Delhi Hub | 750 | 750 | 2026-09-08 | 2026-09-12 | 2026-09-11 |
| **1010** | CUST-904 | PROD-001 | CR-101 | Mumbai Hub | 300 | 200 | 2026-09-09 | 2026-09-13 | 2026-09-14 |

### 2. Product Catalog Directory (`Dim_Products`)
*This lookup matrix categorizes item classes, baseline unit costs, and warehouse storage restrictions.*

| ProductID | ProductName | Category | UnitCost | StorageType |
| :--- | :--- | :--- | :--- | :--- |
| **PROD-001** | Industrial Valve | Spare Parts | 45.00 | Ambient |
| **PROD-002** | Pharmaceutical Grade Vaccine | Medical | 120.00 | Cold Chain |
| **PROD-003** | Lithium-Ion Battery Pack | Electronics | 85.00 | Hazardous |

### 3. Logistics Provider Directory (`Dim_Carriers`)
*This reference database maps shipping methods and agreed contract delivery deadlines.*

| CarrierID | CarrierName | TransportMode | SLA_Agreement_Days |
| :--- | :--- | :--- | :--- |
| **CR-101** | BlueDart Logistics | Road | 4 |
| **CR-102** | DTDC Express | Air | 3 |
| **CR-103** | Delhivery Corporate | Rail | 5 |
