-- =====================================================
-- Manufacturing Quality & Defect Analysis
-- Author: Curtis Stevenson
-- Database: manufacturing_quality
-- Table: manufacturing_defects
--
-- Purpose:
-- Validate Excel-based manufacturing analysis using SQL.
-- These queries identify operational drivers of defects,
-- downtime, and quality outcomes across production.
-- =====================================================


-- ==============================
-- 1. Dataset Overview
-- ==============================
-- Establishes dataset size and baseline defect behavior
SELECT
    COUNT(*) AS total_records,
    ROUND(AVG(defect_rate), 4) AS avg_defect_rate,
    MIN(defect_rate) AS min_defect_rate,
    MAX(defect_rate) AS max_defect_rate
FROM manufacturing_defects;


-- ==============================
-- 2. High vs Low Defect Analysis
-- ==============================
-- Segments production into high and low defect conditions
-- using a business-defined defect threshold
SELECT
    CASE
        WHEN defect_rate > 3.5 THEN 'High Defect'
        ELSE 'Low Defect'
    END AS defect_category,
    COUNT(*) AS record_count,
    ROUND(AVG(defect_rate), 4) AS avg_defect_rate,
    ROUND(MAX(defect_rate), 4) AS max_defect_rate
FROM manufacturing_defects
GROUP BY defect_category;


-- ==============================
-- 3. Production Volume Impact
-- ==============================
-- Evaluates whether production load influences defect behavior
SELECT
    CASE
        WHEN production_volume >= 700 THEN 'High Volume'
        WHEN production_volume BETWEEN 400 AND 699 THEN 'Medium Volume'
        ELSE 'Low Volume'
    END AS production_volume_category,
    ROUND(AVG(defect_rate), 4) AS avg_defect_rate,
    ROUND(AVG(production_volume), 2) AS avg_production_volume
FROM manufacturing_defects
GROUP BY production_volume_category;


-- ==============================
-- 4. Maintenance vs Downtime
-- ==============================
-- Examines how maintenance intensity affects downtime and defects
SELECT
    CASE
        WHEN maintenance_hours >= 12 THEN 'High Maintenance'
        WHEN maintenance_hours BETWEEN 6 AND 11 THEN 'Medium Maintenance'
        ELSE 'Low Maintenance'
    END AS maintenance_category,
    ROUND(AVG(maintenance_hours), 2) AS avg_maintenance_hours,
    ROUND(AVG(downtime_percentage), 4) AS avg_downtime_percentage,
    ROUND(AVG(defect_rate), 4) AS avg_defect_rate
FROM manufacturing_defects
GROUP BY maintenance_category;


-- ==============================
-- 5. Supplier Quality & Delivery Impact
-- ==============================
-- Measures how upstream supply conditions affect defect outcomes
SELECT
    CASE
        WHEN supplier_quality >= 0.9 THEN 'High Supplier Quality'
        ELSE 'Lower Supplier Quality'
    END AS supplier_quality_category,
    ROUND(AVG(delivery_delay), 2) AS avg_delivery_delay,
    ROUND(AVG(defect_rate), 4) AS avg_defect_rate
FROM manufacturing_defects
GROUP BY supplier_quality_category;


-- ==============================
-- 6. Energy Efficiency & Quality
-- ==============================
-- Explores relationships between energy efficiency, quality, and downtime
SELECT
    CASE
        WHEN energy_efficiency >= 0.35 THEN 'High Energy Efficiency'
        WHEN energy_efficiency BETWEEN 0.25 AND 0.349 THEN 'Medium Energy Efficiency'
        ELSE 'Low Energy Efficiency'
    END AS energy_efficiency_category,
    ROUND(AVG(quality_score), 4) AS avg_quality_score,
    ROUND(AVG(defect_rate), 4) AS avg_defect_rate,
    ROUND(AVG(downtime_percentage), 4) AS avg_downtime_percentage
FROM manufacturing_defects
GROUP BY energy_efficiency_category;


-- ==============================
-- 7. Inventory & Stockout Risk
-- ==============================
-- Assesses whether material shortages increase defect risk
SELECT
    CASE
        WHEN stockout_rate >= 0.06 THEN 'High Stockout Risk'
        WHEN stockout_rate BETWEEN 0.03 AND 0.059 THEN 'Medium Stockout Risk'
        ELSE 'Low Stockout Risk'
    END AS stockout_risk_category,
    ROUND(AVG(defect_rate), 4) AS avg_defect_rate,
    ROUND(AVG(quality_score), 4) AS avg_quality_score
FROM manufacturing_defects
GROUP BY stockout_risk_category;


-- ==============================
-- 8. Workforce Productivity & Safety
-- ==============================
-- Evaluates how workforce performance aligns with quality and safety outcomes
SELECT
    CASE
        WHEN worker_productivity >= 0.92 THEN 'High Productivity'
        ELSE 'Lower Productivity'
    END AS productivity_category,
    ROUND(AVG(quality_score), 4) AS avg_quality_score,
    ROUND(AVG(defect_rate), 4) AS avg_defect_rate,
    ROUND(AVG(safety_incidents), 2) AS avg_safety_incidents
FROM manufacturing_defects
GROUP BY productivity_category;
