{% macro clean_state_models(database='dbt', schema='dbt-vvunivola', days = 1, dry_run=true) %}

    {% set get_drop_commands_query  %}
        select
            case
                when table_type = 'VIEW'
                then table_type
                else
                    'TABLE'
                end as drop_type,
                'DROP ' || drop_type || ' {{database | upper }}.' || table_schema || '.' || table_name || ';'
            from {{ database }}.information_schema.tables
            where table_schema = upper('{{ schema }}')
            and last_altered <= current_date - {{ days }}
    {% endset %}

    {{ log('\nGenerating cleanup queries....\n', info=true) }}
    {% set drop_queries = run_query(get_drop_commands_query).columns[1].values() %}

    {% for query in drop_queries %}
        {% if dry_run %}
            {{ log(query, info=true) }}
        {% else %}
            {{ log('Dropping object with command: ' ~ query, info=true) }}
            {% do run_query(query) %}
        {% endif %}
    {% endfor %}

{% endmacro %}