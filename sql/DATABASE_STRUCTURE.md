DATABASE: rwandaro_cooperative_db

1. farmers
- farmer_id (PK)
- full_name
- gender
- region
- phone
- join_date
- status

2. regions
- region_id (PK)
- region_name

3. products
- product_id (PK)
- product_name
- category
- unit_price

4. seasons
- season_id (PK)
- season_name
- start_date
- end_date

5. deliveries
- delivery_id (PK)
- farmer_id (FK)
- product_id (FK)
- season_id (FK)
- delivery_date
- quantity

6. collection_centers
- center_id (PK)
- center_name
- region_id (FK)

7. delivery_collections
- collection_id (PK)
- delivery_id (FK)
- center_id (FK)
- collection_date

8. sales
- sale_id (PK)
- product_id (FK)
- season_id (FK)
- sale_date
- total_amount

9. payments
- payment_id (PK)
- farmer_id (FK)
- season_id (FK)
- payment_date
- amount_paid

10. training_sessions
- training_id (PK)
- topic
- session_date
- region_id (FK)
