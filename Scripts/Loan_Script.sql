/* 
-------------------------------------------------------------------------------
BANK LOAN REPORT SCRIPT OVERVIEW
This script analyzes bank loan performance data, providing insights through several key sections:
A. SUMMARY KPIs: Calculates overall and month-specific metrics such as total loan applications, funded amounts,
   received payments, average interest rates, and debt-to-income (DTI) ratios.
B. GOOD vs BAD LOANS: Breaks down loan performance into 'Good' (Fully Paid/Current) and 'Bad' (Charged Off) categories,
   evaluating application counts, funded amounts, and payment received for each.
C. LOAN STATUS ANALYSIS: Summarizes performance metrics by each loan status, both overall and for December 2021.
D. OVERVIEW TRENDS: Presents trend analyses by issue month, geographic state, loan term, employee length, loan purpose,
   and home ownership status to understand borrower characteristics and funding behavior.
-------------------------------------------------------------------------------
*/

SELECT *
FROM bank_loan_data


-- A.	BANK LOAN REPORT | SUMMARY --

-- Key Performance Indicators (KPIs) Requirements--

-- 1.	Total Loan Applications --
SELECT COUNT(id) AS Total_Loan_Applications						-- Calculates the total number of loan applications
FROM bank_loan_data

SELECT COUNT(id) AS MTD_Total_Loan_Applications   
FROM bank_loan_data
WHERE MONTH(issue_date) = 12									-- Counts loan applications issued in December 2021
	AND YEAR(issue_date) = 2021

SELECT COUNT(id) AS PMTD_Total_Loan_Applications   
FROM bank_loan_data	
WHERE MONTH(issue_date) = 11									-- Counts loan applications issued in November 2021
	AND YEAR(issue_date) = 2021


-- 2.	Total Funded Amount --
SELECT SUM(loan_amount) AS Total_Funded_Amount					-- Sums the total funded loan amounts
FROM bank_loan_data

SELECT SUM(loan_amount) AS MTD_Total_Funded_Amount				-- Sums funded amounts for loans issued in December 2021
FROM bank_loan_data
WHERE MONTH(issue_date) = 12
	AND YEAR(issue_date) = 2021

SELECT SUM(loan_amount) AS PMTD_Total_Funded_Amount				-- Sums funded amounts for loans issued in November 2021
FROM bank_loan_data
WHERE MONTH(issue_date) = 11
	AND YEAR(issue_date) = 2021


-- 3.	Total Amount Received --
SELECT SUM(total_payment) AS Total_Amount_Received				-- Calculates total payments received from all loans
FROM bank_loan_data

SELECT SUM(total_payment) AS MTD_Total_Amount_Received			-- Calculates total payments received for loans issued in December 2021
FROM bank_loan_data
WHERE MONTH(issue_date) = 12
	AND YEAR(issue_date) = 2021

SELECT SUM(total_payment) AS PMTD_Total_Amount_Received			-- Calculates total payments received for loans issued in November 2021
FROM bank_loan_data
WHERE MONTH(issue_date) = 11
	AND YEAR(issue_date) = 2021


-- 4.	Average Interest Rate --
SELECT
	ROUND(AVG(int_rate), 4)*100 AS Average_Interest_Rate		-- Computes average interest rate across all loans
FROM bank_loan_data

SELECT
	ROUND(AVG(int_rate), 4)*100 AS MTD_Average_Interest_Rate	-- Computes average interest rate for loans issued in December 2021
FROM bank_loan_data
WHERE MONTH(issue_date) = 12
	AND YEAR(issue_date) = 2021

SELECT
	ROUND(AVG(int_rate), 4)*100 AS PMTD_Average_Interest_Rate	-- Computes average interest rate for loans issued in November 2021
FROM bank_loan_data
WHERE MONTH(issue_date) = 11
	AND YEAR(issue_date) = 2021


-- 5.	Average Debt to Income Ratio (DTI) --
SELECT ROUND(AVG(dti), 4)*100 AS Average_DTI					-- Calculates average debt-to-income ratio across all loans
FROM bank_loan_data

SELECT ROUND(AVG(dti), 4)*100 AS MTD_Average_DTI				-- Calculates average DTI for loans issued in December 2021
FROM bank_loan_data
WHERE MONTH(issue_date) = 12
	AND YEAR(issue_date) = 2021

SELECT ROUND(AVG(dti), 4)*100 AS PMTD_Average_DTI				-- Calculates average DTI for loans issued in November 2021
FROM bank_loan_data
WHERE MONTH(issue_date) = 11
	AND YEAR(issue_date) = 2021




-- GOOD LOAN VS BAD LOAN KPI’s --

-- Good Loan Issued --
SELECT loan_status												-- Returns all loan statuses to identify good or bad loans
FROM bank_loan_data

-- Good Loan Application Percentage --
SELECT
	(COUNT(
		CASE
			WHEN loan_status = 'Fully Paid' OR loan_status = 'Current'
			THEN id
		END)*100 / (COUNT(id))
	) AS Good_Loan_Percentage									-- Calculates percentage of loans with good status
FROM bank_loan_data

-- Good Loan Applications --
SELECT															
	COUNT(id) AS Good_Loan_Applications							-- Counts total good loan applications
FROM bank_loan_data
WHERE loan_status = 'Fully Paid' OR loan_status = 'Current'

-- Good Loan Funded Amount --
SELECT
	SUM(loan_amount) AS Good_Loan_Funded_Amount					-- Sums funded amounts of good loans
FROM bank_loan_data
WHERE loan_status = 'Fully Paid' OR loan_status = 'Current'

-- Good Loan Total Received Amount --
SELECT
	SUM(total_payment) AS Good_Loan_Amount_Received				-- Sums total payments received from good loans
FROM bank_loan_data
WHERE loan_status = 'Fully Paid' OR loan_status = 'Current'




-- Bad Loan Issued --

-- Bad Loan Percentage --
SELECT
	(COUNT(
		CASE
			WHEN loan_status = 'Charged Off'
			THEN id
		END)*100 / (COUNT(id))
	) AS Bad_Loan_Percentage									-- Calculates percentage of loans charged off
FROM bank_loan_data

-- Bad Loan Applications --
SELECT
	COUNT(id) AS Bad_Loan_Applications							-- Counts total bad loan applications
FROM bank_loan_data
WHERE loan_status = 'Charged Off'

-- Bad Loan Funded Amount --
SELECT
	SUM(loan_amount) AS Bad_Loan_Funded_Amount					-- Sums funded amounts of bad loans
FROM bank_loan_data
WHERE loan_status = 'Charged Off'

-- Bad Loan Total Received Amount --
SELECT
	SUM(total_payment) AS Bad_Loan_Amount_Received				-- Sums total payments received from bad loans
FROM bank_loan_data
WHERE loan_status = 'Charged Off'




-- LOAN STATUS --
SELECT
	loan_status,
	COUNT(id) AS Total_Loan_Application,
	SUM(total_payment) AS Total_Amount_Received,
	SUM(loan_amount) AS Total_Funded_Amount,
	ROUND(AVG(int_rate * 100), 2) AS Interest_Rate,
	ROUND(AVG(dti * 100), 2) AS DTI								-- Aggregates key metrics by loan status
FROM bank_loan_data
GROUP BY loan_status

SELECT
	loan_status,
	SUM(total_payment) AS MTD_Total_Amount_Received,
	SUM(loan_amount) AS MTD_Total_Funded_Amount					-- Aggregates December 2021 metrics by loan status
FROM bank_loan_data
WHERE MONTH(issue_date) = 12 AND YEAR(issue_date) = 2021
GROUP BY loan_status




-- B.	BANK LOAN REPORT | OVERVIEW --

-- 1.	Monthly Trends by Issue Date
SELECT
	MONTH(issue_date) AS Month_Number,
	DATENAME(MONTH, issue_date) AS Month_Name,
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received					-- Analyzes loan trends by month
FROM bank_loan_data
GROUP BY MONTH(issue_date), DATENAME(MONTH, issue_date)
ORDER BY Month_Number


-- 2.	Regional Analysis by State --
SELECT
	address_state AS State,
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received					-- Analyzes loan data across states
FROM bank_loan_data
GROUP BY address_state
ORDER BY address_state


-- 3.	Loan Term Analysis --
SELECT
	term AS Loan_Term,
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received					-- Analyzes loans by term duration
FROM bank_loan_data
GROUP BY term
ORDER BY term


-- 4.	Employee Length Analysis --
SELECT
	emp_length AS Employee_Length,
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received					-- Analyzes loans based on borrower employment length
FROM bank_loan_data
GROUP BY emp_length
ORDER BY emp_length


-- 5.	Loan Purpose Breakdown --
SELECT
	purpose AS Loan_Purpose,
	COUNT(id) AS Total_Loan_Application,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received					-- Breaks down loan metrics by purpose
FROM bank_loan_data
GROUP BY purpose
ORDER BY purpose


-- 6.	Home Ownership Analysis --
SELECT
	home_ownership AS Home_Ownership,
	COUNT(id) AS Total_Loan_Application,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received					-- Analyzes loan metrics by home ownership status
FROM bank_loan_data
GROUP BY home_ownership
ORDER BY 2 DESC


