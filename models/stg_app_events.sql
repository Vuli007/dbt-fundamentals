select * from {{ source('jaffle_shop', 'orders') }}

{{ limit_data_in_dev('_etl_loaded_at',1000) }}