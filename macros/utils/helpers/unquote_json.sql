{% macro unquote_json(col, type=none) -%}
{# Turn a JSON SUPER string ("abc") into a varchar string (abc). #}
(nullif(ltrim(rtrim(json_serialize({{ col }}), '"'), '"'), 'null'))
{%- if type is not none -%}::{{ type }}{%- endif -%}
{%- endmacro %}
