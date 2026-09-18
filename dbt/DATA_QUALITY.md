# Data Quality Notes

## Missing payment

While checking `int_orders_enriched`, I found one delivered order with no matching payment record.

Order ID: `bfbd0f9bdef84302105ad712db648a`
Status: `delivered`
Purchase date: `2016-09-15 12:16:38`

The order exists in `stg_orders`, but there is no matching row in `stg_payments`.

The order is kept in the model and payment fields remain `NULL`. I did not replace the missing value with `0`, since the source data does not tell us whether a payment actually took place.

In a production environment, I would raise this with the data owner and confirm whether delivered orders are expected to always have a payment record.
