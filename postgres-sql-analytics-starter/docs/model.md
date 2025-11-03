
# Data Model Notes

- **customers** ⟶ **orders** ⟶ **order_items** ⟶ **products**
- **orders** ⟶ **payments**

Cardinalities:
- One customer can have many orders.
- One order can have many items.
- One product can appear in many order items.
- One order can have zero or more payments (supporting partials/refunds if extended).

Indexes selected for common analytics joins and filters.
