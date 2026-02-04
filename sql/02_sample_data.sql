USE rwandaro_cooperative_db;

-- ===============================
-- Regions
-- ===============================
INSERT INTO regions (region_name) VALUES
('Nyamasheke'),
('Rutsiro'),
('Rubavu');

-- ===============================
-- Farmers
-- ===============================
INSERT INTO farmers (full_name, gender, region_id, phone, join_date, status) VALUES
('Jean Nkurunziza', 'Male', 1, '0788000001', '2022-01-10', 'Active'),
('Marie Uwimana', 'Female', 1, '0788000002', '2022-02-15', 'Active'),
('Eric Habimana', 'Male', 2, '0788000003', '2021-11-20', 'Active'),
('Alice Mukamana', 'Female', 2, '0788000004', '2023-01-05', 'Inactive'),
('Samuel Niyonzima', 'Male', 3, '0788000005', '2021-08-12', 'Active'),
('Claudine Uwamahoro', 'Female', 3, '0788000006', '2023-03-18', 'Active');

-- ===============================
-- Products
-- ===============================
INSERT INTO products (product_name, category, unit_price) VALUES
('Arabica Grade A', 'Coffee', 4500.00),
('Arabica Grade B', 'Coffee', 3800.00),
('Robusta', 'Coffee', 3200.00),
('Coffee Husks', 'Byproduct', 800.00);

-- ===============================
-- Seasons
-- ===============================
INSERT INTO seasons (season_name, start_date, end_date) VALUES
('Season 2023 A', '2023-01-01', '2023-06-30'),
('Season 2023 B', '2023-07-01', '2023-12-31');

-- ===============================
-- Collection Centers
-- ===============================
INSERT INTO collection_centers (center_name, region_id) VALUES
('Nyamasheke Center', 1),
('Rutsiro Center', 2),
('Rubavu Center', 3);

-- ===============================
-- Deliveries
-- ===============================
INSERT INTO deliveries (farmer_id, product_id, season_id, delivery_date, quantity) VALUES
(1, 1, 1, '2023-02-10', 120),
(1, 2, 1, '2023-03-15', 90),
(2, 1, 1, '2023-02-18', 100),
(3, 3, 1, '2023-04-01', 200),
(5, 2, 2, '2023-08-20', 150),
(6, 1, 2, '2023-09-05', 110);

-- ===============================
-- Delivery Collections
-- ===============================
INSERT INTO delivery_collections (delivery_id, center_id, collection_date) VALUES
(1, 1, '2023-02-10'),
(2, 1, '2023-03-15'),
(3, 1, '2023-02-18'),
(4, 2, '2023-04-01'),
(5, 3, '2023-08-20');

-- ===============================
-- Sales
-- ===============================
INSERT INTO sales (product_id, season_id, sale_date, total_amount) VALUES
(1, 1, '2023-03-01', 540000.00),
(2, 1, '2023-04-10', 342000.00),
(1, 2, '2023-09-15', 495000.00);

-- ===============================
-- Payments
-- ===============================
INSERT INTO payments (farmer_id, season_id, payment_date, amount_paid) VALUES
(1, 1, '2023-06-30', 200000.00),
(2, 1, '2023-06-30', 180000.00),
(3, 1, '2023-06-30', 150000.00),
(5, 2, '2023-12-15', 220000.00);

-- ===============================
-- Training Sessions
-- ===============================
INSERT INTO training_sessions (topic, session_date, region_id) VALUES
('Coffee Quality Improvement', '2023-02-05', 1),
('Post-Harvest Handling', '2023-03-20', 2),
('Sustainable Farming Practices', '2023-08-10', 3);
