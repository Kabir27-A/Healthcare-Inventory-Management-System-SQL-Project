# 💊 Healthcare Inventory Management System (SQL Project)

This project demonstrates a SQL-based database for managing a pharmacy or healthcare inventory system.  
It includes table creation, data insertion, and complex queries using JOINs, aggregates, and views.

---

## 🗂 Files Overview

### 1️⃣ 01_create_tables_and_insert_data.sql
Creates and populates all necessary tables:

| Table Name | Description |
|-------------|-------------|
| **Employees** | Stores employee details (Pharmacist, Manager, Clerk) |
| **Suppliers** | Contains supplier names, contact persons, and contact info |
| **CustomerPatients** | Stores customer/patient contact and address info |
| **Medicines** | Includes medicine name, category, supplier, price, reorder level, and expiry date |
| **Inventory** | Tracks current quantity of each medicine |
| **Orders** | Stores order details linked to both customers and employees |

Includes constraints:
- `PRIMARY KEY`, `FOREIGN KEY`, `CHECK`, and `DEFAULT`
- Ensures referential integrity and data accuracy

---

### 2️⃣ 02_sql_queries_and_analysis.sql
Contains real-world SQL operations such as:

| Query | Description |
|--------|--------------|
| 🧾 **Customer Spending Summary** | Shows each customer's contact and total amount spent |
| 👨‍⚕️ **Employee Sales Report** | Lists all orders with employee names and roles |
| 💊 **Medicine & Supplier Info** | Displays medicines with supplier details |
| ⚠️ **Low Stock Alert** | Finds medicines where quantity is below reorder level with supplier info |
| 📈 **Customer Order View** | Creates a view `order_summary` summarizing total orders and spending |

---

## 🛠 How to Use

1. Open SQL Server Management Studio (SSMS).
2. Run `01_create_tables_and_insert_data.sql` to create the database and tables.
3. Then execute `02_sql_queries_with_joins_and_functions.sql` to view analytical queries and reports.

---

## 🧠 Concepts Used

- **Database Design & Normalization**
- **Primary and Foreign Keys**
- **JOINs (INNER JOIN)**
- **Aggregate Functions:** `SUM`, `COUNT`
- **GROUP BY**, **HAVING**, **ORDER BY**
- **Views for reporting**

---

## 💾 Database
- **Name:** `Healthcare_Inventory_Management`
- **Platform:** Microsoft SQL Server 

---

## 📚 Author
Created as part of an SQL learning and practice project focusing on healthcare inventory and sales management.
