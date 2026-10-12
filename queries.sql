SELECT 
    o.OrderID,
    o.WarehouseLocation,
    p.ProductName,
    c.CarrierName,
    (o.OrderQty - o.DeliveredQty) AS Volume_Deficit,
    CASE 
        WHEN o.ActualDeliveryDate > o.PromisedDeliveryDate THEN 'SLA Breached'
        WHEN o.ActualDeliveryDate IS NULL THEN 'In-Transit'
        ELSE 'On-Time'
    END AS Timeline_Status
FROM 
    Fact_orders o
JOIN 
    Dim_Products p ON o.ProductID = p.ProductID
JOIN 
    Dim_Carriers c ON o.CarrierID = c.CarrierID
ORDER BY 
    Volume_Deficit DESC, Timeline_Status;

