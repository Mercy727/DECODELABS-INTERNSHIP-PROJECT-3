# Decodelabs Internship – Project 3: SQL Sales Analytics

## Overview
This project is a four-part SQL analysis of a 1,200-transaction sales dataset, completed as part of the **Decodelabs Data Analytics Internship**. The goal was to extract business-critical insights — corporate KPIs, marketing channel performance, product rankings, and order fulfillment risk — directly from raw transactional data using T-SQL.

**Tool used:** SQL Server Management Studio (SSMS)
**Database:** `MERCY ADVENTURE`
**Dataset size:** 1,200 transactions

---

## Task 1: Baseline High-Level Corporate KPIs

```sql
SELECT
    COUNT(OrderID) AS Total_Orders,
    SUM(TotalPrice) AS Total_Revenue,
    AVG(TotalPrice) AS Average_Order_Value,
    SUM(Quantity) AS Total_Items_Sold
FROM [MERCY ADVENTURE].[dbo].DATA;
```

| Total Orders | Total Revenue | Avg Order Value | Total Items Sold |
|---|---|---|---|
| 1,200 | $1,264,761.96 | $1,053.97 | 3,535 |

**Insight:** The business processed 1,200 orders generating over $1.26M in revenue, with an average order value of roughly $1,054 — indicating a high-ticket product mix.

---

## Task 2: Marketing Acquisition Channel Performance Matrix

```sql
SELECT
    ReferralSource,
    COUNT(OrderID) AS Total_Orders,
    SUM(TotalPrice) AS Total_Revenue,
    ROUND(AVG(TotalPrice), 2) AS Average_Order_Value
FROM [MERCY ADVENTURE].[dbo].DATA
GROUP BY ReferralSource
ORDER BY Total_Revenue DESC;
```

| Referral Source | Total Orders | Total Revenue | Avg Order Value |
|---|---|---|---|
| Instagram | 259 | $275,285.45 | $1,062.88 |
| Email | 250 | $261,808.55 | $1,047.23 |
| Google | 241 | $250,441.48 | $1,039.18 |
| Facebook | 228 | $250,410.90 | $1,098.29 |
| Referral | 222 | $226,815.58 | $1,021.69 |

**Insight:** Instagram leads in both order volume and total revenue, while Facebook drives the highest average order value — suggesting different channels attract different buyer intent.

---

## Task 3: Product Category Volume & Value Rankings

```sql
SELECT
    Product,
    COUNT(OrderID) AS Total_Orders,
    SUM(Quantity) AS Total_Quantity_Sold,
    SUM(TotalPrice) AS Total_Revenue,
    ROUND(AVG(TotalPrice), 2) AS Average_Order_Value
FROM [MERCY ADVENTURE].[dbo].DATA
GROUP BY Product
ORDER BY Total_Revenue DESC;
```

| Product | Orders | Qty Sold | Total Revenue | Avg Order Value |
|---|---|---|---|---|
| Chair | 178 | 562 | $195,620.11 | $1,098.99 |
| Printer | 181 | 542 | $195,612.61 | $1,080.73 |
| Laptop | 173 | 535 | $192,126.56 | $1,110.56 |
| Tablet | 179 | 497 | $186,568.95 | $1,042.28 |
| Monitor | 163 | 480 | $175,651.41 | $1,077.62 |
| Desk | 170 | 508 | $167,459.93 | $985.06 |
| Phone | 156 | 411 | $151,722.39 | $972.58 |

**Insight:** Chairs and printers top the revenue rankings despite moderate order counts, while laptops post the highest average order value of any category — a strong margin driver even with fewer units sold.

---

## Task 4: Operational Fulfillment Risk & Funnel Audits

```sql
SELECT
    OrderStatus,
    COUNT(OrderID) AS Total_Orders,
    SUM(TotalPrice) AS Total_Revenue,
    ROUND(AVG(TotalPrice), 2) AS Average_Order_Value
FROM [MERCY ADVENTURE].[dbo].DATA
GROUP BY OrderStatus
ORDER BY Total_Orders DESC;
```

| Order Status | Total Orders | Total Revenue | Avg Order Value |
|---|---|---|---|
| Cancelled | 250 | $276,396.21 | $1,105.58 |
| Returned | 247 | $243,277.70 | $984.93 |
| Pending | 237 | $256,328.15 | $1,081.55 |
| Shipped | 235 | $246,159.58 | $1,047.49 |
| Delivered | 231 | $242,600.32 | $1,050.22 |

**Insight:** Cancelled orders represent the single largest status group by both volume and revenue at risk ($276K) — higher than fully Delivered orders. This flags a fulfillment funnel issue worth investigating further.

---

## Key Takeaways
- Revenue is heavily concentrated in high-ticket items rather than high order volume.
- Instagram and Email are the strongest acquisition channels by revenue.
- Laptops and chairs are the most valuable product categories per order.
- Order cancellations represent a meaningful revenue leak and a priority area for operational review.

## Tools & Skills Applied
- T-SQL (aggregate functions, GROUP BY, ORDER BY, ROUND)
- SQL Server Management Studio (SSMS)
- Business KPI design and interpretation
- Data storytelling and insight reporting

---
*Project completed by Mercy as part of the Decodelabs Data Analytics Internship.*
