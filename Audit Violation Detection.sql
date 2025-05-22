SELECT * FROM expense_claims LIMIT 10;

-- Audit Violation Queries
-- 1. Over-Limit Expenses
SELECT * FROM expense_claims
WHERE (category = 'Meals' AND amount > 100)
   OR (category = 'Travel' AND amount > 500)
   OR (category = 'Lodging' AND amount > 1000);

-- 2. Missing Receipts
SELECT * FROM expense_claims
WHERE receipt_uploaded = "No";

-- 3. Late Approvals
SELECT *, DATEDIFF(approval_date, expense_date) AS days_to_approve
FROM expense_claims
WHERE approval_date IS NOT NULL
  AND DATEDIFF(approval_date, expense_date) > 7;

-- 4. Duplicate Claims
SELECT employee_id, expense_date, category, amount, COUNT(*) AS claim_count
FROM expense_claims
GROUP BY employee_id, expense_date, category, amount
HAVING claim_count > 1;

-- 5. Unapproved Claims
SELECT * FROM expense_claims
WHERE approval_date IS NULL OR approved_by IS NULL;