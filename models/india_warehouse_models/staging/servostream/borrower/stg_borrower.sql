Select 
    pinstid,
    trim(borrower_name) as borrower_name,
    trim(branch) as branch,
    nature_of_facility,
    principle_o_s,
    cast(record_creation_date as date) as record_creation_date,  
    interest_rate,
    penalty_rate,
    trim(institution_name) as institution_name,
    trim(trust_name) as trust_name,                             
    trim(loan_account_no) as loan_account_no,
    trim(final_loan_status) as final_loan_status,
    cast(sanction_date as date) as sanction_date,
    sanction_amount,
    cast(npa_date as date) as npa_date,
    collected_amount,
    trim(bank_lan) as bank_lan,
    trim(state) as state,
    cast(current_allocation_date as date) as current_allocation_date,
    trim(team_lead_name) as team_lead_name

from {{ source('servostream', 'borrower') }}



