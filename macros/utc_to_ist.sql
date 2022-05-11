{% macro convert_utc_to_ist(column_name) -%}

--{{ column_name }} at time zone 'India Standard Time' 
--CONVERT(DATETIME, {{ column_name }} AT TIME ZONE 'India Standard Time')

dateadd(minutes, 330,{{ column_name }})

{%- endmacro -%}