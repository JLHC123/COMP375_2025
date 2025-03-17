SELECT *
FROM Customer
FULL OUTER JOIN CustomerAddress ON Customer.CustomerId = CustomerAddress.CustomerId;