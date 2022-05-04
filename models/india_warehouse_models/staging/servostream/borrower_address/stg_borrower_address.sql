Select 

    pinstid,
    forkid as fork_id,
    trim(type_of_address) as type_of_address,
    trim(kind_of_address) as kind_of_address,
    trim(address_line1) as address_line1,
    trim(address_line2) as address_line2,
    trim(address_line3) as address_line3,
    trim(address_state) as address_state,
    trim(address_city) as address_city,
    address_pincode as address_pin_code,
    mobile_no as mobile_number,
    trim(email_id) as email_id,
    stdcode as std_code,
    landlineno as landline_number,
    trim(customer_name) as customer_name,
    cast(created_date as date) as created_date,
    cast(date_of_birth as date) as date_of_birth,
    alternate_mobile,
    recordid as record_id,
    maker_id,
    trim(maker_name) as maker_name,
    checker_id,
    trim(checker_name) as checker_name,
    trim(checker_status) as checker_status,
    customer_panno,
    customer_aadhar_no as customer_aadhar_number,
    alternate_mobile_2,
    alternate_mobile_3,
    trim(remarks) as remarks

from {{ source('servostream', 'borrower_address') }}



