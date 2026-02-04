# Agricultural Cooperative Sales Analysis

> **Case Study**: Rwandaro Coffee Farmers Cooperative

![MySQL](https://img.shields.io/badge/MySQL-8.0-00758F?style=for-the-badge&logo=mysql&logoColor=white)
![PL/SQL](https://img.shields.io/badge/Language-PL%2FSQL-orange?style=for-the-badge)
![Status](https://img.shields.io/badge/Status-Completed-success?style=for-the-badge)

## Project Overview

**Rwandaro Coffee Farmers Cooperative** aggregates coffee produce from registered farmers for regional and international markets. Despite having raw data, the cooperative lacks the analytical capability to track farmer performance or seasonal trends efficiently.

This project implements a robust **Database Solution** using **MySQL 8.0** to solve these challenges through:

- **Advanced Join Operations** for data aggregation.
- **Window Functions** for analytical reporting (Ranking, Moving Averages, Quartiles).

---

## Student Information

| Attribute      | Details                                      |
| :------------- | :------------------------------------------- |
| **Name**       | GASANA SHEMA Philbert                        |
| **Student ID** | 28279                                        |
| **Group**      | B                                            |
| **Course**     | Database Development with PL/SQL (INSY 8311) |

---

## Key Features

<table>
<tr>
<td width="50%">

### Analytical Goals

- **Top Farmer Identification**: Ranking contributors by volume/revenue.
- **Sales Trends**: Running totals and monthly growth analysis.
- **Segmentation**: Grouping farmers into performance quartiles.
- **Seasonal Analysis**: 3-Month moving averages to smooth out volatility.

</td>
<td width="50%">

### Technical Implementation

- **Schema Design**: Normalized Relational Model.
- **Complexity**: Nested Queries, CTEs, and Window Functions (`RANK`, `LAG`, `NTILE`, `SUM OVER`).
- **Visualization**: ER Diagram and structured datasets.

</td>
</tr>
</table>

---

graph LR
    A[Farmers] -->|Deliver Coffee| B(Cooperative)
    B -->|Process & Example| C{Market Sales}
    C -->|Regional| D[Analyze Revenue]
    C -->|International| D
    D -->|SQL Window Functions| E[Insights]
    E -->|Decisions| F[Incentives & Planning]
```

---

## Database Architecture

The system tracks **Farmers**, **Deliveries**, **Products**, and **Sales**.

<div align="center">
  <img src="er_diagram/erd.png" alt="ER Diagram" width="800">
  <br>
  <em>Figure 1: Entity Relationship Diagram (ERD)</em>
</div>

> [!TIP]
> View the detailed structure documentation [here](sql/DATABASE_STRUCTURE.md).

---

## 📂 Repository Structure

```tree
plsql_window_functions_28279_philbert
├── 📂 sql/
│   ├── 01_schema.sql
│   ├── 02_sample_data.sql
│   ├── 03_joins.sql
│   ├── 04_window_functions.sql
│   └── *.md
├── 📂 screenshots/
├── 📂 er_diagram/
└── 📄 README.md
```

---
## Results & Analysis

- **Performance Variation**: Significant disparity found between top-performing farmers and average contributors. ([JOINS.md](sql/JOINS.md))
- **Seasonal Trends**: Sales peak during harvest seasons; identified using `AVG() OVER()` moving averages. ([WINDOW_FUNCTIONS.md](sql/WINDOW_FUNCTIONS.md))
- **Actionable Insight**: The segmentation (`NTILE`) suggests the need for a tiered incentive program. ([WINDOW_FUNCTIONS.md](sql/WINDOW_FUNCTIONS.md))

---

## Integrity Statement

> "All sources were properly cited. Implementations and analysis represent original work. No AI-generated content was copied without attribution or adaptation."

---

## References

1.  [Geeks for Geeks](https://www.geeksforgeeks.org/sql/window-functions-in-sql/) — Window Functions
2. [MySQL Documentation](https://dev.mysql.com/doc/refman/8.0/en/window-functions-usage.html) — MySQL Window Functions
3.  [Rwandaro Coffee Farmers Cooperative Official Website](https://rwandarocoffee.com/) 
4.  INSY 8311 Course Materials
5.  [ChatGPT](https://chat.openai.com/) (to refine my english)

---

<div align="center">
  <sub>End of Report | © 2026 Gasana Shema Philbert - 28279</sub>
</div>
