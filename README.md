# Restaurant-Orders-Analysis

---

# 🍔 Restaurant Orders Analysis

## 📚 About Data

This project analyzes restaurant transaction data to understand customer purchasing behavior, menu performance, and overall revenue trends.

The dataset contains comprehensive information separated into key tables, including `menu_items.csv` and `order_details.csv`. The data encompasses details such as order time, item categories, pricing, and individual menu items.

## 💡 Highlights

* The restaurant generated a total gross income of 159K between January 1, 2023, and March 31, 2023.
* **Asian** and **Italian** cuisines are the primary revenue drivers, contributing 50K (31.19%) and 46K (29.16%) respectively.
* **Hamburger** and **Edamame** are the most successful menu items, generating over 600 orders each.
* We analyzed the least and most ordered items across all categories to determine product popularity.


* We evaluated the number of orders based on operational hours to identify peak and quiet times for the restaurant.


* Calculated the total revenue and total orders for each cuisine category to determine which menus to focus on for future development.



## 🧹 Data Wrangling

Conducted data exploration and data cleaning using SQL before building the dashboard:

* Extracted the earliest and latest order dates to understand the timeframe of the dataset.
* Checked for duplicate records using CTE and `ROW_NUMBER()` window functions partitioned by order details.


* Screened for missing (`NULL`) values across critical columns in the `menu_items` and `order_details` tables.


* Performed `LEFT JOIN` operations to merge `menu_items` and `order_details` based on the item ID for comprehensive analysis.



📍 **SQL Script:** [EDA_&_Data_Cleaning_Restaurant.sql](EDA_&_Data_Cleaning_Restaurant.sql)

📍 **Raw Data:** `restaurant_db_data_dictionary.csv`, `menu_items.csv`, `order_details.csv`

## 📊 Visualization

Produced a 1-pager interactive dashboard using **Power BI** to track total gross income, revenue by category, and top/bottom performing menu items.

<img width="1600" height="943" alt="restaurant_visualization" src="https://github.com/user-attachments/assets/72e52060-46e4-4393-9244-b711bf9d8c35" />

---
