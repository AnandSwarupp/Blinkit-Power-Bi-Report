CREATE VIEW blinkit_database AS
SELECT 
    o.order_id,
    c.customer_id,
    c.customer_name,
    c.customer_segment,
    o.delivery_partner_id,
    o.order_date,
    o.payment_method,
    c.area, 
    oi.product_id, 
    oi.quantity,
    
    p.product_name,
    p.category,
    p.price,
    cf.feedback_id,
    o.promised_delivery_time,
    o.actual_delivery_time,
    dp.reasons_if_delayed,
    dp.delivery_time_minutes,
    dp.promised_time,
    dp.actual_time,
    cf.feedback_category,
    cf.feedback_text,
    cf.sentiment AS feedback_segment,
    CONVERT(DATE, o.order_date) AS order_date_only, 
    ROUND(p.price * oi.quantity, 2) AS order_value,
    r.Emoji,
    r.star,
    ci.img,
    r.Rating
FROM [dbo].[blinkit_orders] o
LEFT JOIN [dbo].[blinkit_customers] c 
    ON c.customer_id = o.customer_id
LEFT JOIN [dbo].[blinkit_order_items] oi 
    ON oi.order_id = o.order_id
LEFT JOIN [dbo].[blinkit_products] p 
    ON p.product_id = oi.product_id
LEFT JOIN [dbo].[blinkit_customer_feedback] cf 
    ON cf.customer_id = o.customer_id 
    AND cf.order_id = o.order_id
LEFT JOIN [dbo].[blinkit_delivery_performance] dp 
    ON dp.order_id = o.order_id 
    AND dp.delivery_partner_id = o.delivery_partner_id
LEFT JOIN [dbo].[Rating_Icon] r
    ON cf.rating = r.Rating
LEFT JOIN [dbo].[Category_Icons] ci
    ON p.category = ci.category;


	