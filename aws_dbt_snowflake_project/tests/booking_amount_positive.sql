{{ config(
    severity='error'
) }}

SELECT
    *
FROM
    {{ source('staging', 'bookings') }}
WHERE
    BOOKING_AMOUNT < 0