{% set configs = [
    {
        "table": ref('obt'),
        "columns": "GOLD_OBT.BOOKING_ID, GOLD_OBT.HOST_ID, GOLD_OBT.LISTING_ID, GOLD_OBT.TOTAL_AMOUNT, GOLD_OBT.ACCOMMODATES, GOLD_OBT.BEDROOMS, GOLD_OBT.BATHROOMS, GOLD_OBT.PRICE_PER_NIGHT, GOLD_OBT.RESPONSE_RATE",
        "alias": "GOLD_OBT",
    },
    {
        "table": ref('dim_listings'),
        "columns": "",
        "alias": "DIM_LISTINGS",
        "join_condition": "GOLD_OBT.LISTING_ID = DIM_LISTINGS.LISTING_ID"
    },
    {
        "table": ref('dim_hosts'),
        "columns": "",
        "alias": "DIM_HOSTS",
        "join_condition": "GOLD_OBT.HOST_ID = DIM_HOSTS.HOST_ID"
    }
] %}



SELECT
        {{ configs[0]['columns'] }}

FROM
    {% for config in configs %}
    {% if loop.first %}
        {{ config['table'] }} AS {{ config['alias'] }}
    {% else %}
        LEFT JOIN {{ config['table'] }} AS {{ config['alias'] }}
        ON {{ config['join_condition'] }}
    {% endif %}
    {% endfor %}
