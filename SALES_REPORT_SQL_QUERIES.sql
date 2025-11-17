SELECT * FROM SALES_REPORT;

-----------------------------------------------------------
-- 1. PREVIEW DATA
-----------------------------------------------------------

-- View first 10 rows
SELECT * FROM( SELECT S.*,ROWNUM FROM sales_report S) WHERE ROWNUM <=10;

-- Count total rows
SELECT COUNT(*) AS total_records
FROM sales_report;

-- Check missing values
SELECT
    SUM(CASE WHEN sku_code IS NULL THEN 1 ELSE 0 END) AS missing_sku,
    SUM(CASE WHEN design_no IS NULL THEN 1 ELSE 0 END) AS missing_design,
    SUM(CASE WHEN stock IS NULL THEN 1 ELSE 0 END) AS missing_stock,
    SUM(CASE WHEN category IS NULL THEN 1 ELSE 0 END) AS missing_category,
    SUM(CASE WHEN size_ IS NULL THEN 1 ELSE 0 END) AS missing_size,
    SUM(CASE WHEN color IS NULL THEN 1 ELSE 0 END) AS missing_color
FROM sales_report;


-----------------------------------------------------------
-- 2. BASIC SELECT, WHERE, ORDER BY, GROUP BY
-----------------------------------------------------------

-- Stock in descending order
SELECT design_no, sku_code, stock
FROM sales_report
ORDER BY stock DESC;

-- Filter by color
SELECT *
FROM sales_report
WHERE color = 'Red';

-- Count items per category
SELECT category, COUNT(*) AS items_count
FROM sales_report
GROUP BY category
ORDER BY items_count DESC;

-- Total stock per design
SELECT design_no, SUM(stock) AS total_stock
FROM sales_report
GROUP BY design_no
ORDER BY total_stock DESC;


-----------------------------------------------------------
-- 3. AGGREGATE ANALYSIS
-----------------------------------------------------------

-- Stock statistics
SELECT 
    SUM(stock) AS total_stock,
    AVG(stock) AS avg_stock,
    MIN(stock) AS min_stock,
    MAX(stock) AS max_stock
FROM sales_report;

-- Stock per color
SELECT color, SUM(stock) AS total_stock
FROM sales_report
GROUP BY color
ORDER BY total_stock DESC;

-- Category-wise stock
SELECT category, SUM(stock) AS total_stock
FROM sales_report
GROUP BY category
ORDER BY total_stock DESC;


-----------------------------------------------------------
-- 4. SUBQUERIES
-----------------------------------------------------------

-- Items with above-average stock
SELECT sku_code, design_no, stock
FROM sales_report
WHERE stock > (SELECT AVG(stock) FROM sales_report);

-- Colors having more than 10 stock
SELECT color
FROM sales_report
GROUP BY color
HAVING SUM(stock) > 10;

-- Items belonging to most common category
SELECT *
FROM sales_report
WHERE category = (
    SELECT category FROM (
        SELECT category, COUNT(*) AS cnt
        FROM sales_report
        GROUP BY category
        ORDER BY cnt DESC
    ) WHERE ROWNUM = 1
);


-----------------------------------------------------------
-- 6. ADVANCED PATTERNS
-----------------------------------------------------------

-- Top 5 SKUs by stock
SELECT *
FROM sales_report
ORDER BY stock DESC;

-- Best-selling color per category
SELECT category, color, SUM(stock) AS total_stock
FROM sales_report
GROUP BY category, color
ORDER BY category, total_stock DESC;

-- Count of SKUs per size
SELECT size_, COUNT(*) AS count_skus
FROM sales_report
GROUP BY size_
ORDER BY count_skus DESC;


-----------------------------------------------------------
-- 7. VIEWS FOR ANALYSIS
-----------------------------------------------------------

-- View: Stock per design
CREATE OR REPLACE VIEW vw_stock_per_design AS
SELECT design_no, SUM(stock) AS total_stock
FROM sales_report
GROUP BY design_no;

-- View: Summary for dashboards
CREATE OR REPLACE VIEW vw_sales_summary AS
SELECT 
    category,
    color,
    size,
    SUM(stock) AS total_stock,
    COUNT(*) AS sku_count
FROM sales_report
GROUP BY category, color, size;


-----------------------------------------------------------
-- 8. PERFORMANCE OPTIMIZATION (INDEXES)
-----------------------------------------------------------

-- Index on design number
CREATE INDEX idx_design_no ON sales_report (design_no);

-- Index on category
CREATE INDEX idx_category ON sales_report (category);

-- Index on color
CREATE INDEX idx_color ON sales_report (color);


-----------------------------------------------------------
-- END OF FULL SQL ANALYSIS SCRIPT
-----------------------------------------------------------
