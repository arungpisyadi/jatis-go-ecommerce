# List all customers located in Irvine city.
SELECT *  FROM `customers` WHERE `shipCity` LIKE 'Irvine city';

# List of customers whose order is handled by an employee named Adam Barr.
SELECT * 
FROM customers c LEFT JOIN
(
    SELECT o.customerID, o.employeeID, o.orderDate, o.purchaseOrderNumber, e.firstName, e.lastName, e.title, e.phone
    FROM orders o LEFT JOIN employees e
    ON o.employeeID = e.ID
    WHERE e.firstName LIKE 'Adam' AND
    e.lastName LIKE 'Barr'
) q
ON c.ID = q.customerID;

# List of products which are ordered by "Contonso, Ltd" Company.
SELECT *
FROM products p 
LEFT JOIN
(
	select od.quantity, od.price, od.discount, od.productID
    FROM order_details od
    LEFT JOIN
    (
    	SELECT o.ID AS orderID, o.customerID, o.employeeID, o.orderDate, c.companyName, c.firstName, c.lastName
        FROM orders o LEFT JOIN customers c
        ON o.customerID = c.ID
        WHERE c.companyName = 'Contonso, Ltd'
    ) qo
    ON od.orderID = qo.orderID
)qp
ON p.ID = qp.productID;

# List of transactions (orders) which has "UPS Ground" as shipping method.
SELECT o.customerID, o.employeeID, o.orderDate, o.purchaseOrderNumber, o.shipDate, o.shippingMethodID, sm.method
FROM orders o LEFT JOIN shipping_methods sm
ON o.shippingMethodID = sm.ID
WHERE sm.method LIKE 'UPS Ground';

# List of total cost (including tax and freight charge) for every order sorted by ship date.
