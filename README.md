
# 📊 Bank Loan Analysis Project

---

## 📚 Project Overview
This project analyzes and visualizes bank loan data using Power BI. The goal is to provide financial institutions with actionable insights into loan distributions, borrower behavior, and funding trends to aid in credit risk assessment and decision-making.

---

## ❗ Problem Statement
Banks face the challenge of understanding which customer segments are more likely to default or require extended repayment terms. This project aims to uncover trends in loan applications, funding, interest rates, and repayments by segmenting the data based on various borrower attributes.

---

## 📊 Key Visuals in the Power BI Dashboard

### ✅ Overview Page
- Total Loan Applications: **38.6K**
- Total Funded Amount: **$435.8M**
- Total Amount Received: **$473.1M**
- Average Interest Rate: **12.05%**
- Average DTI: **13.33%**

**Visuals:**
- Line chart: Funded Amount by Month
- Map: Funded Amount by State
- Donut chart: Funded Amount by Term (36/60 months)
- Bar charts: By Purpose, Employee Length, Home Ownership

### ✅ Detailed Page
- Interactive table with filters for:
  - Loan Purpose
  - Home Ownership
  - Grade/Sub-grade
  - Issue Date
  - Funded Amount
  - Installment
  - Amount Received

---

## 💼 Summary
The Power BI dashboard gives a high-level and granular view of bank loans, allowing decision-makers to filter and explore loan metrics by borrower demographics, geographic location, and loan characteristics.

---

## 🔎 Overview
Loan distribution and funding patterns across the U.S. are visualized with emphasis on loan term popularity, borrower employment length, and purpose. High concentrations of loans are observed in categories such as debt consolidation and credit card refinancing.

---

## 📈 Detailed
Detailed insights are derived by examining each record with filters and slicers. These allow users to interact with specific borrower profiles and compare them against macro trends.

---

## 💡 Key Insights
- **Debt Consolidation** leads in funding volume (~$230M)
- **MORTGAGE** ownership category received **$219.33M**
- **60-month terms** cover **62.66%** of loans
- Employees with **10+ years** experience received **$116M**
- **California** and **New York** were top states for loan issuance

---

## 🛠️ Tools and Technologies
- **Power BI** – Dashboard creation and data modeling  
- **Excel** – Initial data cleaning and preparation  
- **DAX** – Measures and KPIs  
- **Power Query M** – Data transformations  
- **PowerPoint** – Presentation formatting  

---

## 🗄️ Database Structure
The dataset includes fields such as:
- `loan_amnt`
- `funded_amnt`
- `int_rate`
- `installment`
- `grade`, `sub_grade`
- `home_ownership`
- `purpose`
- `emp_length`
- `addr_state`
- `issue_d`

---

## ⚙️ Key Features
- Dynamic filtering by home ownership, purpose, state, etc.
- MoM and MTD indicators
- Interactive charts and maps
- Detailed record table with drill-through

---

## 🚀 How to Run the Project
1. Open Power BI Desktop.
2. Load the provided `.pbix` file or recreate visuals using the PowerPoint slides.
3. Connect to the sample loan data (CSV/Excel).
4. Ensure relationships are established based on key fields like `loan_id` or `member_id`.
5. Publish to Power BI Service (optional).

---

## 📄 Access Full Documentation
👉 [Attach SQL Script or Google Drive/Repo link here]

---

## 📜 License
This project is licensed under the MIT License.

---

## 🙌 Acknowledgments
Thanks to open-source datasets and resources that inspired the visual layout and structure. Special appreciation to financial data enthusiasts and dashboard design communities.
