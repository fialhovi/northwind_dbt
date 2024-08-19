-- Active: 1707860150269@@127.0.0.1@5432
--
-- Name: pk_categories; Type: CONSTRAINT; Schema: raw; Owner: -; Tablespace: 
--

ALTER TABLE ONLY "raw".categories
    ADD CONSTRAINT pk_categories PRIMARY KEY (category_id);


--
-- Name: pk_customer_customer_demo; Type: CONSTRAINT; Schema: raw; Owner: -; Tablespace: 
--

ALTER TABLE ONLY "raw".customer_customer_demo
    ADD CONSTRAINT pk_customer_customer_demo PRIMARY KEY (customer_id, customer_type_id);


--
-- Name: pk_customer_demographics; Type: CONSTRAINT; Schema: raw; Owner: -; Tablespace: 
--

ALTER TABLE ONLY "raw".customer_demographics
    ADD CONSTRAINT pk_customer_demographics PRIMARY KEY (customer_type_id);


--
-- Name: pk_customers; Type: CONSTRAINT; Schema: raw; Owner: -; Tablespace: 
--

ALTER TABLE ONLY "raw".customers
    ADD CONSTRAINT pk_customers PRIMARY KEY (customer_id);


--
-- Name: pk_employees; Type: CONSTRAINT; Schema: raw; Owner: -; Tablespace: 
--

ALTER TABLE ONLY "raw".employees
    ADD CONSTRAINT pk_employees PRIMARY KEY (employee_id);


--
-- Name: pk_employee_territories; Type: CONSTRAINT; Schema: raw; Owner: -; Tablespace: 
--

ALTER TABLE ONLY "raw".employee_territories
    ADD CONSTRAINT pk_employee_territories PRIMARY KEY (employee_id, territory_id);


--
-- Name: pk_order_details; Type: CONSTRAINT; Schema: raw; Owner: -; Tablespace: 
--

ALTER TABLE ONLY "raw".order_details
    ADD CONSTRAINT pk_order_details PRIMARY KEY (order_id, product_id);


--
-- Name: pk_orders; Type: CONSTRAINT; Schema: raw; Owner: -; Tablespace: 
--

ALTER TABLE ONLY "raw".orders
    ADD CONSTRAINT pk_orders PRIMARY KEY (order_id);


--
-- Name: pk_products; Type: CONSTRAINT; Schema: raw; Owner: -; Tablespace: 
--

ALTER TABLE ONLY "raw".products
    ADD CONSTRAINT pk_products PRIMARY KEY (product_id);


--
-- Name: pk_region; Type: CONSTRAINT; Schema: raw; Owner: -; Tablespace: 
--

ALTER TABLE ONLY "raw".region
    ADD CONSTRAINT pk_region PRIMARY KEY (region_id);


--
-- Name: pk_shippers; Type: CONSTRAINT; Schema: raw; Owner: -; Tablespace: 
--

ALTER TABLE ONLY "raw".shippers
    ADD CONSTRAINT pk_shippers PRIMARY KEY (shipper_id);


--
-- Name: pk_suppliers; Type: CONSTRAINT; Schema: raw; Owner: -; Tablespace: 
--

ALTER TABLE ONLY "raw".suppliers
    ADD CONSTRAINT pk_suppliers PRIMARY KEY (supplier_id);


--
-- Name: pk_territories; Type: CONSTRAINT; Schema: raw; Owner: -; Tablespace: 
--

ALTER TABLE ONLY "raw".territories
    ADD CONSTRAINT pk_territories PRIMARY KEY (territory_id);


--
-- Name: pk_usstates; Type: CONSTRAINT; Schema: raw; Owner: -; Tablespace: 
--

ALTER TABLE ONLY "raw".us_states
    ADD CONSTRAINT pk_usstates PRIMARY KEY (state_id);


--
-- Name: fk_orders_customers; Type: Constraint; Schema: raw; Owner: -
--

-- ALTER TABLE ONLY "raw".orders
--     ADD CONSTRAINT fk_orders_customers FOREIGN KEY (customer_id) REFERENCES customers;


-- --
-- -- Name: fk_orders_employees; Type: Constraint; Schema: raw; Owner: -
-- --

-- ALTER TABLE ONLY "raw".orders
--     ADD CONSTRAINT fk_orders_employees FOREIGN KEY (employee_id) REFERENCES employees;


-- --
-- -- Name: fk_orders_shippers; Type: Constraint; Schema: raw; Owner: -
-- --

-- ALTER TABLE ONLY "raw".orders
--     ADD CONSTRAINT fk_orders_shippers FOREIGN KEY (ship_via) REFERENCES shippers;


-- --
-- -- Name: fk_order_details_products; Type: Constraint; Schema: raw; Owner: -
-- --

-- ALTER TABLE ONLY "raw".order_details
--     ADD CONSTRAINT fk_order_details_products FOREIGN KEY (product_id) REFERENCES products;


-- --
-- -- Name: fk_order_details_orders; Type: Constraint; Schema: raw; Owner: -
-- --

-- ALTER TABLE ONLY "raw".order_details
--     ADD CONSTRAINT fk_order_details_orders FOREIGN KEY (order_id) REFERENCES orders;


-- --
-- -- Name: fk_products_categories; Type: Constraint; Schema: raw; Owner: -
-- --

-- ALTER TABLE ONLY "raw".products
--     ADD CONSTRAINT fk_products_categories FOREIGN KEY (category_id) REFERENCES categories;


-- --
-- -- Name: fk_products_suppliers; Type: Constraint; Schema: raw; Owner: -
-- --

-- ALTER TABLE ONLY "raw".products
--     ADD CONSTRAINT fk_products_suppliers FOREIGN KEY (supplier_id) REFERENCES suppliers;


-- --
-- -- Name: fk_territories_region; Type: Constraint; Schema: raw; Owner: -
-- --

-- ALTER TABLE ONLY "raw".territories
--     ADD CONSTRAINT fk_territories_region FOREIGN KEY (region_id) REFERENCES region;


-- --
-- -- Name: fk_employee_territories_territories; Type: Constraint; Schema: raw; Owner: -
-- --

-- ALTER TABLE ONLY "raw".employee_territories
--     ADD CONSTRAINT fk_employee_territories_territories FOREIGN KEY (territory_id) REFERENCES territories;


-- --
-- -- Name: fk_employee_territories_employees; Type: Constraint; Schema: raw; Owner: -
-- --

-- ALTER TABLE ONLY "raw".employee_territories
--     ADD CONSTRAINT fk_employee_territories_employees FOREIGN KEY (employee_id) REFERENCES employees;


-- --
-- -- Name: fk_customer_customer_demo_customer_demographics; Type: Constraint; Schema: raw; Owner: -
-- --

-- ALTER TABLE ONLY "raw".customer_customer_demo
--     ADD CONSTRAINT fk_customer_customer_demo_customer_demographics FOREIGN KEY (customer_type_id) REFERENCES customer_demographics;


-- --
-- -- Name: fk_customer_customer_demo_customers; Type: Constraint; Schema: raw; Owner: -
-- --

-- ALTER TABLE ONLY "raw".customer_customer_demo
--     ADD CONSTRAINT fk_customer_customer_demo_customers FOREIGN KEY (customer_id) REFERENCES customers;


-- --
-- -- Name: fk_employees_employees; Type: Constraint; Schema: raw; Owner: -
-- --

-- ALTER TABLE ONLY "raw".employees
--     ADD CONSTRAINT fk_employees_employees FOREIGN KEY (reports_to) REFERENCES employees;
    