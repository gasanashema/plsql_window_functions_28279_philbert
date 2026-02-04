# Database Structure

## Overview

**Database Name**: `rwandaro_cooperative_db`
**DBMS**: MySQL 8.0
**Purpose**: Manages agricultural data including farmers, products, deliveries, and sales for the Rwandaro Coffee Farmers Cooperative.

---

## Entity Relationship Diagram (ERD)

The database follows a normalized relational model connecting farmers to their deliveries, sales, and training sessions.

<div align="center">
  <img src="../er_diagram/erd.png" alt="ER Diagram" width="800">
</div>

---

## Schema Reference

### 1. Farmers

Stores profile information for all registered cooperative members.

| Column      | Type                        |  Key  | Description                           |
| :---------- | :-------------------------- | :---: | :------------------------------------ |
| `farmer_id` | `INT`                       | 🔑 PK | Unique identifier for each farmer     |
| `full_name` | `VARCHAR(100)`              |       | Full legal name of the farmer         |
| `gender`    | `ENUM('Male','Female')`     |       | Gender of the farmer                  |
| `region_id` | `INT`                       | 🔗 FK | Links to the **Regions** table        |
| `phone`     | `VARCHAR(20)`               |       | Contact number                        |
| `join_date` | `DATE`                      |       | Registration date                     |
| `status`    | `ENUM('Active','Inactive')` |       | Membership status (Default: 'Active') |

### 2. Regions

Geographical zones where the cooperative operates.

| Column        | Type          |  Key  | Description                      |
| :------------ | :------------ | :---: | :------------------------------- |
| `region_id`   | `INT`         | 🔑 PK | Unique identifier for the region |
| `region_name` | `VARCHAR(50)` |       | Name of the region (Unique)      |

### 3. Products

Agricultural goods or by products managed by the cooperative.

| Column         | Type            |  Key  | Description                                 |
| :------------- | :-------------- | :---: | :------------------------------------------ |
| `product_id`   | `INT`           | 🔑 PK | Unique identifier for the product           |
| `product_name` | `VARCHAR(100)`  |       | Name of the product (e.g., Arabica Grade A) |
| `category`     | `VARCHAR(50)`   |       | Product category (e.g., Coffee, Byproduct)  |
| `unit_price`   | `DECIMAL(10,2)` |       | Standard unit price per kg                  |

### 4. Seasons

Defines agricultural cycles for reporting and data aggregation.

| Column        | Type          |  Key  | Description                                     |
| :------------ | :------------ | :---: | :---------------------------------------------- |
| `season_id`   | `INT`         | 🔑 PK | Unique identifier for the season                |
| `season_name` | `VARCHAR(50)` |       | Description of the season (e.g., Season 2023 A) |
| `start_date`  | `DATE`        |       | Season start date                               |
| `end_date`    | `DATE`        |       | Season end date                                 |

### 5. Deliveries

Records of produce brought by farmers to the cooperative.

| Column          | Type            |  Key  | Description                            |
| :-------------- | :-------------- | :---: | :------------------------------------- |
| `delivery_id`   | `INT`           | 🔑 PK | Unique delivery record ID              |
| `farmer_id`     | `INT`           | 🔗 FK | Who made the delivery                  |
| `product_id`    | `INT`           | 🔗 FK | What was delivered                     |
| `season_id`     | `INT`           | 🔗 FK | When it was delivered (Season context) |
| `delivery_date` | `DATE`          |       | Actual date of delivery                |
| `quantity`      | `DECIMAL(10,2)` |       | Quantity in kg                         |

### 6. Collection Centers

Physical facilities where produce is aggregated.

| Column        | Type           |  Key  | Description                   |
| :------------ | :------------- | :---: | :---------------------------- |
| `center_id`   | `INT`          | 🔑 PK | Unique center ID              |
| `center_name` | `VARCHAR(100)` |       | Name of the collection center |
| `region_id`   | `INT`          | 🔗 FK | Location of the center        |

### 7. Delivery Collections

Links individual farmer deliveries to specific collection centers.

| Column            | Type   |  Key  | Description                        |
| :---------------- | :----- | :---: | :--------------------------------- |
| `collection_id`   | `INT`  | 🔑 PK | Unique collection transaction ID   |
| `delivery_id`     | `INT`  | 🔗 FK | Reference to the original delivery |
| `center_id`       | `INT`  | 🔗 FK | Where it was collected             |
| `collection_date` | `DATE` |       | Date of collection at the center   |

### 8. Sales

Records of produce sold by the cooperative to external markets.

| Column         | Type            |  Key  | Description                     |
| :------------- | :-------------- | :---: | :------------------------------ |
| `sale_id`      | `INT`           | 🔑 PK | Unique sale transaction ID      |
| `product_id`   | `INT`           | 🔗 FK | Product sold                    |
| `season_id`    | `INT`           | 🔗 FK | Season associated with the sale |
| `sale_date`    | `DATE`          |       | Date of sale                    |
| `total_amount` | `DECIMAL(12,2)` |       | Total revenue generated         |

### 9. Payments

Financial transactions paying farmers for their produce.

| Column         | Type            |  Key  | Description           |
| :------------- | :-------------- | :---: | :-------------------- |
| `payment_id`   | `INT`           | 🔑 PK | Unique payment ID     |
| `farmer_id`    | `INT`           | 🔗 FK | Recipient farmer      |
| `season_id`    | `INT`           | 🔗 FK | Season being paid for |
| `payment_date` | `DATE`          |       | Date of payment       |
| `amount_paid`  | `DECIMAL(12,2)` |       | Amount distributed    |

### 10. Training Sessions

Capacity building workshops attended by farmers.

| Column         | Type           |  Key  | Description                |
| :------------- | :------------- | :---: | :------------------------- |
| `training_id`  | `INT`          | 🔑 PK | Unique training session ID |
| `topic`        | `VARCHAR(100)` |       | Subject of the training    |
| `session_date` | `DATE`         |       | Date conducted             |
| `region_id`    | `INT`          | 🔗 FK | Region where it was held   |

---

## Key Relationships

- **Farmers belongs to Regions**: `farmers.region_id` → `regions.region_id`
- **Farmers make Deliveries**: `deliveries.farmer_id` → `farmers.farmer_id`
- **Deliveries are Aggregated at Centers**: `delivery_collections` links `deliveries` to `collection_centers`.
- **Sales track Revenue**: `sales` link `products` and `seasons` to track income.
- **Payments track Expenses**: `payments` link `farmers` to `seasons` to track payout.

---


