## 1. Identify High-Usage Columns

## Based on typical query patterns:

**User**

email (WHERE for login, lookup)

role (WHERE for RBAC, admin queries)

**Booking**

user_id (JOIN/filter by user’s bookings)

property_id (JOIN to property details)

(start_date, end_date) (filter availability, ORDER BY calendar)

status (WHERE for pending/confirmed/canceled)

**Property**

host_id (JOIN/filter host’s listings)

location_id (filter by location)

price_per_night (range filters, ORDER BY price)