# Internal Control Audit Simulator – Expense Claims

This project simulates an internal audit workflow for detecting policy violations in employee expense reimbursement data. It uses SQL queries to flag risks such as over-limit expenses, missing receipts, late approvals, duplicate claims, and unapproved reimbursements.

## Dataset
Simulated data generated with Python and imported into MySQL Workbench. Fields include:
- employee_id, expense_date, category, amount
- receipt_uploaded, approved_by, approval_date, claim_id

## Anomaly Checks (Audit Flags)
- **Over-limit expenses**: Meals > $100, Travel > $500, Lodging > $1000  
- **Missing receipts**: `receipt_uploaded = 'No'`  
- **Late approvals**: `approval_date` more than 7 days after `expense_date`  
- **Duplicate claims**: Same employee/date/category/amount  
- **Unapproved claims**: `approval_date` or `approved_by` is NULL

## Tools Used
- MySQL Workbench
- Python (for CSV generation)
- SQL (for audit query logic)

## Outcome
This project demonstrates the use of SQL for real-world internal audit risk detection and supports visualization-ready outputs for Tableau.
