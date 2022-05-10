Select 

    pinstid,
    trim(loan_account_no) as loan_account_no,
    trim(payment_mode) as payment_mode,
    payment_amount,
    trim(payment_remarks) as payment_remarks,
    created_date,
    cast(payment_deposit_date as date) as payment_deposit_date,
    trim(allocation_user_name) as trim,
    allocation_sap_id,
    trim(checker_status) as checker_status

from {{ source('servostream', 'receipting') }}