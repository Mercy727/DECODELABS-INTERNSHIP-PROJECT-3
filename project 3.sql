-- Task 1: Baseline High-Level Corporate KPIs
SELECT 
    COUNT(OrderID) AS Total_Orders,
    SUM(TotalPrice) AS Total_Revenue,
    AVG(TotalPrice) AS Average_Order_Value,
    SUM(Quantity) AS Total_Items_Sold
FROM [MERCY ADVENTURE].[dbo].DATA;

-- Task 2: Marketing Acquisition Channel Performance Matrix
SELECT 
    ReferralSource,
    COUNT(OrderID) AS Total_Orders,
    SUM(TotalPrice) AS Total_Revenue,
    ROUND(AVG(TotalPrice), 2) AS Average_Order_Value
FROM [MERCY ADVENTURE].[dbo].DATA
GROUP BY ReferralSource
ORDER BY Total_Revenue DESC;

-- Task 3: Product Category Volume & Value Rankings
SELECT 
    Product,
    COUNT(OrderID) AS Total_Orders,
    SUM(Quantity) AS Total_Quantity_Sold,
    SUM(TotalPrice) AS Total_Revenue,
    ROUND(AVG(TotalPrice), 2) AS Average_Order_Value
FROM [MERCY ADVENTURE].[dbo].DATA
GROUP BY Product
ORDER BY Total_Revenue DESC;

-- Task 4: Operational Fulfillment Risk & Funnel Audits
SELECT 
    OrderStatus,
    COUNT(OrderID) AS Total_Orders,
    SUM(TotalPrice) AS Total_Revenue,
    ROUND(AVG(TotalPrice), 2) AS Average_Order_Value
FROM [MERCY ADVENTURE].[dbo].DATA
GROUP BY OrderStatus
ORDER BY Total_Orders DESC;