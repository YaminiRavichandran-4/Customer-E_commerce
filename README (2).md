# 🛒 E-Commerce SQL Analytics — Advanced MySQL Project

A complete **MySQL e-commerce database** with a fully normalized schema, realistic seed data, and **12 production-style analytical reports** spanning customer analytics, product intelligence, inventory management, and sales performance.

---

## 📁 Project Structure

```
ecommerce-sql-analytics/
│
├── week2_query.sql      # Full schema + seed data + 12 analytical reports
├── erd.mwb              # MySQL Workbench ERD (Entity Relationship Diagram)
├── reports.csv          # Output: Customer lifetime value report
│
├── requirements.txt
└── README.md
```

---

## 🗄️ Database Schema

### Core Tables

```
customers ──────────────────────────────┐
  customer_id PK                        │
  first_name, last_name                 │
  email (UNIQUE), phone, city           │
  created_at                            │
                                        │
products                         orders ┘
  product_id PK                    order_id PK
  product_name, category            customer_id FK
  price, cost                       order_date
  created_at                        status ENUM
                                    total_amount
        │                                │
        └──────── order_items ───────────┘
                    order_item_id PK
                    order_id FK, product_id FK
                    quantity, unit_price
                    line_total (GENERATED STORED)
```

### Extended Tables

```
returns                      promotions
  return_id PK                 promo_id PK
  order_item_id FK             promo_code (UNIQUE)
  product_id FK                discount_type ENUM
  customer_id FK               discount_value
  order_id FK                  min_order_value
  return_reason ENUM           usage_limit, time_used
  return_status ENUM           start_date, end_date
  refund_amount
  returned_at, processed_at         │
                                    │
product_inventory            order_promotions
  inventory_id PK              order_promo_id PK
  product_id FK                order_id FK
  stock_quantity               promo_id FK
  reserved_quantity            discount_applied
  restock_threshold            applied_at
  restock_quantity
  unit_cost
  last_restocked_at, updated_at
```

### ENUM Reference

| Column           | Values                                               |
|------------------|------------------------------------------------------|
| `orders.status`         | `Ordered` · `Shipped` · `Cancelled` · `Delivered` |
| `returns.return_reason` | `Defective` · `Wrong Item` · `Changed Mind` · `Damaged` |
| `returns.return_status` | `Pending` · `Approved` · `Rejected` · `Refunded` |
| `promotions.discount_type` | `PERCENTAGE` · `FIXED`                        |

---

## 📊 Seed Data

| Table               | Rows |
|---------------------|------|
| `customers`         | 50   |
| `products`          | 50   |
| `orders`            | 50   |
| `order_items`       | 50   |
| `returns`           | 50   |
| `promotions`        | 50   |
| `order_promotions`  | 50   |
| `product_inventory` | 50   |

---

## 📈 12 Analytical Reports

### 4.1 — Customer Analytics

| # | Report | SQL Techniques |
|---|--------|----------------|
| 01 | **Monthly Revenue Trend with MoM % Change** | CTE, `LAG()`, `ROUND()`, `DATE_FORMAT()`, percentage change formula |
| 02 | **RFM Customer Scoring** | CTE layering, `DATEDIFF()`, `NTILE(5)`, composite score, segment labels (Champions / Loyal / Potential / At Risk) |
| 03 | **Customer Cohort Retention Table** | `ROW_NUMBER()`, `TIMESTAMPDIFF()`, conditional `COUNT(DISTINCT)`, cohort self-join |
| 04 | **First Purchase vs. Repeat Purchase Revenue Split** | `ROW_NUMBER() PARTITION BY customer_id`, conditional `SUM()`, % of total |
| 05 | **Customer Churn Risk Segmentation** | `MAX(order_date)`, `DATEDIFF(CURDATE(), ...)`, CASE WHEN thresholds — Active / Low Risk / Medium Risk / High Risk |

### 4.2 — Product & Inventory Intelligence

| # | Report | SQL Techniques |
|---|--------|----------------|
| 06 | **Product Margin Ranking by Category** | `RANK() PARTITION BY category ORDER BY margin DESC`, `(price - cost) / price` formula |
| 07 | **Low-Stock & Restock Alert Report** | JOIN `product_inventory`, urgency flags — Out of Stock / Critical / Urgent / Normal |
| 08 | **Return Rate by Product and Category** | LEFT JOIN `returns`, `NULLIF()`, `ROUND()`, GROUP BY category + product |
| 09 | **Top & Bottom 5 Products by Net Revenue (after returns)** | `COALESCE(SUM(refund_amount), 0)`, dual `RANK()` ascending and descending |

### 4.3 — Sales Performance & Promotions

| # | Report | SQL Techniques |
|---|--------|----------------|
| 10 | **Promotion Effectiveness Report** | LEFT JOIN `order_promotions`, conditional aggregation, avg AOV with vs. without promo |
| 11 | **Weekly Sales Heatmap (Day of Week × Week Number)** | `WEEKDAY()`, `EXTRACT(WEEK)`, `CASE WHEN` pivot columns (Mon–Sun) |
| 12 | **Category Revenue Breakdown with Subtotals** | `GROUP BY ROLLUP`, `GROUPING()`, `COALESCE` label formatting for Grand Total rows |

---

## ⚙️ Setup & Usage

### Prerequisites

- **MySQL 8.0+** — required for window functions, `ROLLUP`, `GROUPING()`, and generated columns
- **MySQL Workbench 8.0+** — recommended for running scripts and opening `erd.mwb`

### Run the project

```sql
SOURCE week2_query.sql;
```

> The script starts with `DROP DATABASE IF EXISTS` and `CREATE DATABASE`, so it always runs on a clean slate. No prior setup needed.

### Open the ERD

Open `erd.mwb` in MySQL Workbench to view the full Entity Relationship Diagram.

---

## 🔑 Design Highlights

- `line_total` is a **generated stored column** (`quantity * unit_price`) — always consistent, no manual calculation needed.
- All foreign keys use `ON UPDATE CASCADE ON DELETE CASCADE` for clean referential integrity.
- All revenue queries filter on `status = 'Delivered'` to exclude cancelled and in-transit orders.
- `email` on `customers` is `UNIQUE` and `phone` is `NOT NULL` — basic data quality enforced at schema level.
- Promotions include `CHECK` constraints on `discount_value >= 0` and `end_date > start_date`.

---

## 📄 Output File

| File           | Contents                                           |
|----------------|----------------------------------------------------|
| `reports.csv`  | Customer lifetime value — top customers by total spend on delivered orders |

---

## 🛠️ Tech Stack

| Tool            | Purpose                             |
|-----------------|-------------------------------------|
| MySQL 8.0+      | Database engine                     |
| MySQL Workbench | ERD design, script execution        |
| SQL             | Schema design, window functions, analytics |

---

## 📄 License

This project is for educational and portfolio purposes.
