# customer-retention-analysis

> End-to-end retention analysis using transactional e-commerce data — SQL, Python, and Tableau.

---

## Overview

This project simulates the work of a Junior Data Analyst embedded in a product team. Starting from raw transactional data, it answers key business questions around customer behavior, cohort retention, and long-term value.

**Business questions addressed:**
- How do sales evolve over time?
- Which customers return and which don't?
- Which cohorts show the strongest retention?
- Which products generate the most long-term value?

---

## Stack

| Tool | Purpose |
|---|---|
| MySQL | Data storage, complex queries (CTEs, window functions, JOINs) |
| Python (pandas, numpy) | Data cleaning, cohort matrix, feature engineering |
| Tableau Public | Interactive dashboard — retention trends, KPIs |
| Jupyter Notebook | Analysis workflow and documentation |
| GitHub | Version control and portfolio showcase |

---

## Project Structure

```
customer-retention-analysis/
│
├── data/
│   ├── raw/               # Original dataset (not tracked by git)
│   └── processed/         # Cleaned and transformed data
│
├── sql/
│   ├── schema.sql         # Table definitions
│   └── queries/           # Modular SQL files by topic
│       ├── kpis.sql
│       ├── cohort_analysis.sql
│       └── ltv_approximation.sql
│
├── notebooks/
│   └── 01_eda_and_cohorts.ipynb
│
├── dashboard/
│   └── screenshots/       # Tableau dashboard previews
│
├── .gitignore
├── requirements.txt
└── README.md
```

---

## Key Analyses

- **Cohort retention matrix** — monthly retention rates by acquisition cohort
- **New vs. returning customers** — monthly breakdown of customer segments
- **Approximate LTV** — cumulative revenue per cohort over time
- **Sales trend** — revenue and order volume over the full period

---

## Dataset

**Online Retail II — UCI Machine Learning Repository**  
~500k real transactions from a UK-based retailer (2009–2011).  
Source: [Kaggle](https://www.kaggle.com/datasets/mashlyn/online-retail-ii-uci)

---

## [Dashboard](https://public.tableau.com/app/profile/jose.dominguezz/viz/CustomerRetentionDashboard_17719094833280/CustomerRetentionDashboard?publish=yes)

![Dashboard en Tableau](dashboard\Customer_Retention_Dashboard.png)

---

## Setup

```bash
# 1. Clone the repo
git clone https://github.com/your-username/customer-retention-analysis.git
cd customer-retention-analysis

# 2. Create virtual environment
python -m venv venv
source venv/bin/activate  # Windows: venv\Scripts\activate

# 3. Install dependencies
pip install -r requirements.txt

# 4. Load data into MySQL
mysql -u root -p < sql/schema.sql
```

---
