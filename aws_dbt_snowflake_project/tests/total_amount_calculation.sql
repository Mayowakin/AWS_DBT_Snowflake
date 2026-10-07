{{ config(
    severity='error'
) }}

SELECT
    s.BOOKING_ID,
    s.TOTAL_AMOUNT,
    ROUND(
        b.NIGHTS_BOOKED * b.BOOKING_AMOUNT,
        2
    ) + b.CLEANING_FEE + b.SERVICE_FEE AS EXPECTED_TOTAL_AMOUNT
FROM {{ ref('silver_bookings') }} AS s
JOIN {{ ref('bronze_bookings') }} AS b
    ON s.BOOKING_ID = b.BOOKING_ID
WHERE s.TOTAL_AMOUNT != (
    ROUND(
        b.NIGHTS_BOOKED * b.BOOKING_AMOUNT,
        2
    ) + b.CLEANING_FEE + b.SERVICE_FEE
)