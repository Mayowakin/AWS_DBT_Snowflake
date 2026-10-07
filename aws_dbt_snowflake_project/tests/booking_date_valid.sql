{{ config(
    severity='error'
) }}

SELECT
    *
FROM
    {{ source('staging', 'bookings') }}
WHERE
    BOOKING_DATE > CURRENT_DATE()