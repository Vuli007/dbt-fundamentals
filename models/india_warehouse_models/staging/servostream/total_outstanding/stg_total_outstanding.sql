Select 

    record_id,
    trim(loan_account_no) as loan_account_no,
    pinstid,
    old_total_dues,
    interest,
    penalty,
    calculated_date,
    new_total_dues,
    closing_balance

from {{ source('servostream', 'total_outstanding') }}