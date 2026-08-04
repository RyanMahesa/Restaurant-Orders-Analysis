-- Lihat keseluruhan data 
SELECT * FROM menu_items;
SELECT * FROM order_details;

-- Menghitung total menu
SELECT count(*) AS total_menu
FROM menu_items;

-- Menghitung total pesanan 
SELECT count(*) AS total_pesanan
FROM order_details;

-- Ngintip beberapa data dari menu (sample 5 data) 
SELECT * FROM menu_items
LIMIT 5;

-- Ngintip beberapa data dari total pesanan (sample 5 data) 
SELECT * FROM order_details
LIMIT 5;

-- Melihat timeframe pesanan awal dan akhir
SELECT
	MIN(order_date) AS Pesanan_Terawal,
    MAX(order_date) AS Pesanan_Terakhir
FROM order_details;

-- Mengenal kategori produk
SELECT DISTINCT category
FROM menu_items;

-- Melakukan pengecekan data duplicate
WITH cteOrder AS(
SELECT *, ROW_NUMBER() OVER(PARTITION BY order_details_id, order_id, order_date, order_time) AS row_num
FROM order_details
)
SELECT * FROM cteOrder
WHERE row_num > 1;

-- Mencari missing values 
SELECT * FROM menu_items
WHERE 
	menu_item_id IS NULL 
    or item_name IS NULL 
    or category IS NULL 
    or price IS NULL;

-- Mencari missing values 
SELECT * FROM order_details
WHERE 
	order_details_id IS NULL 
    or order_id IS NULL 
    or order_date IS NULL 
    or order_time IS NULL 
    or item_id IS NULL;

-- 1. The least and most ordered items 
SELECT 
	m.item_name, 
	m.category, 
    COUNT(o.order_details_id) AS Number_Of_Orders
FROM 
	menu_items AS m 
LEFT JOIN 
	order_details AS o
	ON m.menu_item_id = o.item_id
WHERE 
	o.item_id IS NOT NULL
GROUP BY 
	m.item_name,
    m.category
ORDER BY 
	Number_Of_Orders DESC -- Ubah ke ASC jika ingin melihat least ordered most
LIMIT 5;

-- 2. Highest spend orders and which items did they buy and how much did they spend?
SELECT 
	m.item_name,
    COUNT(o.order_details_id) AS Number_Of_Orders,
    (COUNT(o.order_details_id) * m.price) AS Highest_Spend_Orders
FROM 
	menu_items AS m 
LEFT JOIN 
	order_details AS o
	ON m.menu_item_id = o.item_id
WHERE 
	o.item_id IS NOT NULL
GROUP BY 
	m.item_name,
    m.price
ORDER BY 
	Highest_Spend_Orders DESC -- Ubah ke ASC jika ingin melihat pesanan dan spend yang paling sedikit
LIMIT 5;

-- 3. Were there certain times that had more or less orders?
SELECT 
	HOUR(order_time) AS Operational_Hours,
    COUNT(order_details_id) AS Number_Of_Orders
FROM order_details
GROUP BY HOUR(order_time)
ORDER BY Operational_Hours ASC;

-- 4. Which cuisines should we focus on developing more menu items for based on the data? 
SELECT 
    m.category,
    COUNT(DISTINCT m.menu_item_id) AS Jumlah_Pilihan_Menu,
    COUNT(o.order_details_id) AS Total_Pesanan,
    SUM(m.price) AS Total_Pendapatan
FROM 
    menu_items AS m
LEFT JOIN 
    order_details AS o
    ON m.menu_item_id = o.item_id
WHERE 
    o.item_id IS NOT NULL
GROUP BY 
    m.category
ORDER BY 
    Total_Pendapatan DESC;