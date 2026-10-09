# End-to-End Supply Chain Fulfillment & Logistics Control Tower

## Project Overview
This project functions as a logistical control tower dashboard designed to monitor global shipment timelines, evaluate third-party logistics (3PL) fulfillment, and mitigate inventory stockout risks. Built entirely in a cloud ecosystem (Microsoft Fabric / Power BI Web) to bypass local OS hardware restrictions.

---

## Dashboard Page Breakdown & Visuals

### 1. KPI Overview (The Executive View)
![KPI Overview](KPI Overview)

* **Operational Value:** This page functions as the executive entry point. It answers "what happened" across the global network. It allows senior managers to immediately evaluate total processing volume and track which regional distribution hubs (Mumbai, Chennai, Delhi) are handling the highest transactional workflows.

### 2. Carrier SLA Performance (The Logistics View)
![Carrier SLA Performance](Carrier SLA Performance)

* **Operational Value:** This page handles third-party logistics (3PL) governance. By combining geographical distribution markers with carrier dimensions (BlueDart, DTDC, Delhivery), operations teams can evaluate lane efficiency, identify routing bottlenecks, and hold shipping vendors strictly accountable to contractual transit timelines.

### 3. Inventory & Supply Health (The Risk Analysis View)
![Inventory & Supply Health](Inventory & Supply Health)

* **Operational Value:** This page answers "why" fulfillment gaps occur. Instead of focusing on logistics delays, it tracks material shortages and inventory deficits. By contrasting exactly what the customer ordered against what the warehouse picked and shipped, it automatically isolates stockouts (e.g., vaccine cold-chain short-shipments) before they disrupt assembly lines.

---

## Technical Architecture (Star Schema)
The database structure is engineered using a professional relational Star Schema:
* **Fact_orders (Core Transactions):** Stores operational delivery metrics, volumes, and regional distribution hub data.
* **Dim_Carriers (Logistics Context):** Stores courier names, transit modes, and SLA agreements.
* **Dim_Products (Product Catalog):** Tracks storage conditions (Cold Chain, Ambient, Hazardous) and costs.
